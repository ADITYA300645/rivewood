import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/ThreeDModelProvider.dart';

class ThreeDProductViewer extends ConsumerWidget {
  late String productId;
  ThreeDProductViewer({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double zoom = ref.watch(zoomProvider);
    double rotation = ref.watch(rotationProvider);
    var interactiviy = ref.watch(interactivityProvider);
    AsyncValue<Object> threeDModel = ref.watch(threeDModelProvider(productId));
    return threeDModel.when(
        data: (model) {
          return Container(
            child: Stack(children: [
              GestureDetector(
                child: Cube(
                  interactive: interactiviy,
                  onSceneCreated: (scene) {
                    scene.world.add(model);
                  },
                ),
              ),
              Positioned(
                right: 20,
                height: 350,
                // width: 350,
                bottom: 60,
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          ref
                              .watch(zoomProvider.notifier)
                              .update((state) => state + 1);
                          model.scale.setFrom(Vector3.all(zoom));
                          model.updateTransform();
                        },
                        icon: Icon(Icons.add)),
                    Text("${zoom.toStringAsFixed(2)}"),
                    IconButton(
                        onPressed: () {
                          ref
                              .watch(zoomProvider.notifier)
                              .update((state) => state - 1);
                          model.scale.setFrom(Vector3.all(zoom));
                          model.updateTransform();
                        },
                        icon: Icon(Icons.minimize_rounded)),
                  ],
                ),
              ),
              Positioned(
                  bottom: 28,
                  width: 350,
                  child: Slider(
                    min: 0,
                    max: 180,
                    onChanged: (value) {
                      ref
                          .watch(rotationProvider.notifier)
                          .update((state) => value);
                      model.rotation.y = value;
                      model.updateTransform();
                    },
                    value: rotation,
                  )),
              Positioned(
                  right: 20,
                  bottom: 30,
                  child: IconButton(
                      onPressed: () {
                        ref
                            .watch(interactivityProvider.notifier)
                            .update((state) => !state);
                      },
                      icon: Icon(Icons.fullscreen)))
            ]),
          );
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(
              child: Text("loading..."),
            ));
  }
}
