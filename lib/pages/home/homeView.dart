import 'package:flutter/material.dart';
import 'package:rivewood/pages/home/Widgets/CategoryExplore/CategoryExplore.dart';
import 'package:rivewood/pages/home/Widgets/Collections/CollectionWidgetView.dart';
import 'package:rivewood/pages/home/Widgets/newArrival/newArrival.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      NewArrival(),
      Collection(),
      CategoryExplore(),
      //todo : get bottom bar height and add it in bottom of padding
      Padding(padding: EdgeInsets.only(bottom: 68))
    ]));
  }
}
