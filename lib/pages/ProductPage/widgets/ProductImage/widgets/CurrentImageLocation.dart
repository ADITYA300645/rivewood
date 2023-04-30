import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivewood/pages/ProductPage/widgets/ProductImage/widgets/CurrentImageLocationProvider.dart';

class CurrentImageLocation extends ConsumerWidget {
  late int totalImages;
  CurrentImageLocation({Key? key, required this.totalImages}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentIndex = ref.watch(currentImageIndexProvider);
    return Positioned(
        width: MediaQuery.of(context).size.width,
        bottom: 10,
        // height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 88.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(totalImages, (index) {
                if (index == currentIndex) {
                  return Expanded(
                    flex: 1,
                    child: Card(
                      color: Colors.grey,
                      child: Container(
                        height: 10,
                      ),
                    ),
                  );
                }
                return Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      pageController.animateToPage(index,
                          duration: Duration(milliseconds: 700),
                          curve: Curves.easeInOut);
                    },
                    child: Card(
                      child: Container(
                        height: 10,
                      ),
                    ),
                  ),
                );
              })),
        ));
  }
}
