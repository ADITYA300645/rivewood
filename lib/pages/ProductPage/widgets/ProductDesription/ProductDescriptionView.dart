import 'package:flutter/material.dart';

class ProductDesription extends StatelessWidget {
  late String? name;
  late String? description;
  late int? price;
  ProductDesription(
      {Key? key,
      required this.description,
      required this.name,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$name", style: Theme.of(context).textTheme.titleMedium),
              Text(
                "-\$$price",
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: Text(
            "$description",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        )
      ],
    );
  }
}
