import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class BottomBar extends ConsumerWidget {
  List<Widget> children;
  double height;
  MainAxisAlignment spacing;
  BottomBar(
      {Key? key,
      required this.children,
      this.height = 60,
      this.spacing = MainAxisAlignment.spaceAround})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
        bottom: 10,
        width: MediaQuery.of(context).size.width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            // color: Colors.blue,
            elevation: 11,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: spacing,
              children: children,
            ),
          ),
        ));
  }
}
