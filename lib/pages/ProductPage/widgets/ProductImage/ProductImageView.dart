import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivewood/constants/Constants.dart' as Constants;
import 'package:rivewood/core/widgets/ThreeDProductViewer.dart';
import 'package:rivewood/pages/ProductPage/widgets/ProductImage/widgets/CurrentImageLocation.dart';
import 'package:rivewood/pages/ProductPage/widgets/ProductImage/widgets/CurrentImageLocationProvider.dart';

class ProductImage extends StatelessWidget {
  String productId;
  int imagesCount;
  ProductImage({Key? key, required this.imagesCount, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        // ThreeDProductViewer(productId: productId),
        Consumer(
            builder: (context, ref, child) => PageView.builder(
                  physics: ScrollPhysics(),
                  scrollBehavior: ScrollBehavior(),
                  controller: pageController,
                  onPageChanged: (value) => imagePageHandler(ref, value),
                  itemCount: imagesCount + 1,
                  itemBuilder: (context, index) {
                    if (index == imagesCount) {
                      return GestureDetector(
                          // behavior: HitTestBehavior.deferToChild,
                          // onHorizontalDragStart: (val) {},
                          // onVerticalDragUpdate: (val) {},
                          child: ThreeDProductViewer(productId: productId));
                    }
                    return Card(
                      child: Image.network(
                          fit: BoxFit.cover,
                          Constants.productImageUrl(productId, index)),
                    );
                  },
                )),
        CurrentImageLocation(
          totalImages: imagesCount + 1,
        )
      ]),
    );
  }
}
