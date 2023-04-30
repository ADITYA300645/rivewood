import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Rating overview",
                  style: Theme.of(context).textTheme.titleSmall),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("0/5"),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        size: 34,
                      )),
            ),
            Text("24415 Ratings"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${index + 1} ⭐"),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Container(
                              width: (MediaQuery.of(context).size.width / 1.8),
                              height: 8,
                              color: Colors.blueGrey,
                              child: Row(
                                children: [
                                  Container(
                                    color: Colors.yellow,
                                    width: (index + 1) *
                                        100 /
                                        (MediaQuery.of(context).size.width /
                                            1.8) *
                                        100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("${index * 100}"),
                          )
                        ],
                      )),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
