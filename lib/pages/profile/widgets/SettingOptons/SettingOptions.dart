import 'package:flutter/material.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Settings",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 10,
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text("$index"),
                subtitle: Text("the index is $index"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
