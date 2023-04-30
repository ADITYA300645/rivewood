import 'package:flutter/material.dart';

class ScrollThroughSuggestion extends StatelessWidget {
  const ScrollThroughSuggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
          //todo IMplement for Mouse Scrolls -- implement for keyboard
          scrollDirection: Axis.vertical,
          children: [
            PageView(children: [Text("Nested 1"), Text("Nested 2")]),
            Text("BELOW"),
          ]),
      // todo calculate thhe position according to Device Size
      Positioned(
          bottom: 200,
          right: 5,
          child:
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))),
      Positioned(
          bottom: 160,
          right: 5,
          child:
              IconButton(onPressed: () {}, icon: Icon(Icons.comment_outlined))),
      Positioned(
          bottom: 120,
          right: 5,
          child: IconButton(onPressed: () {}, icon: Icon(Icons.send))),
      Positioned(
          bottom: 80,
          right: 5,
          child: IconButton(
              onPressed: () {}, icon: Icon(Icons.psychology_outlined)))
    ]);
  }
}
