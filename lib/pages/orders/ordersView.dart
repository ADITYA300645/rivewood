import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Orders",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        GridView.builder(
            padding: EdgeInsets.all(8.0),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                ),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
      ],
    ));
  }
}
