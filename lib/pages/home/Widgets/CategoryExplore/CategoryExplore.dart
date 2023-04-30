import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryExplore extends StatelessWidget {
  const CategoryExplore({Key? key}) : super(key: key);

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
                "Categories",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.filter_list_rounded))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: ListView.builder(
              itemCount: 50,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Chip(label: Text("Category")),
                );
              },
            ),
          ),
        ),
        GridView.custom(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 6,
                pattern: const [
                  QuiltedGridTile(4, 4),
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(6, 6),
                  QuiltedGridTile(3, 3),
                  QuiltedGridTile(3, 3),
                ],
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                repeatPattern: QuiltedGridRepeatPattern.inverted),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: 8,
              (context, index) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(child: Text("HELO $index")));
              },
            ))
      ],
    );
  }
}
