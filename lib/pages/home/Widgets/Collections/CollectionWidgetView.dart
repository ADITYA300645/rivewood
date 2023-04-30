import 'package:flutter/material.dart';

class Collection extends StatelessWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Collections",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right_alt))
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              // color: Colors.lightBlueAccent,
              child: Container(
                height: 250,
                child: Center(child: Text("THE INDEX IS : $index")),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            // color: Colors.lightBlueAccent,
            child: Container(
              height: 50,
              child: Center(child: Text("Click To expand ")),
            ),
          ),
        ),
      ],
    );
  }
}
