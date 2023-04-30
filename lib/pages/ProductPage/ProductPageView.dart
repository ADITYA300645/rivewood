import 'package:flutter/material.dart';
import 'package:rivewood/core/Models/Product.dart';
import 'package:rivewood/pages/ProductPage/widgets/ProductDesription/ProductDescriptionView.dart';
import 'package:rivewood/pages/ProductPage/widgets/ProductImage/ProductImageView.dart';
import 'package:rivewood/pages/ProductPage/widgets/ProductQnA/ProductQnAView.dart';
import 'package:rivewood/pages/ProductPage/widgets/ProductRatings/ProductRatings.dart';
import 'package:rivewood/pages/ProductPage/widgets/ProductReview/ProductReviewView.dart';
import 'package:rivewood/pages/ProductPage/widgets/RelatedProducts/RelatedProductView.dart';
import 'package:rivewood/pages/home/homeView.dart';
import 'package:rivewood/utils/BottomNavigationBar/RoutedScreenBottomBar.dart';

class ProductPage extends StatelessWidget {
  late Product product;
  ProductPage({Key? key, required Product this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product!.name ?? "No Name"),
      ),
      body: Stack(children: [
        Center(
          child: SingleChildScrollView(
              // physics: ScrollPhysics(),
              child: Container(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductImage(
                  imagesCount: product.imagesCount, productId: product.id),
              ProductDesription(
                  name: product.name,
                  description: product.description,
                  price: product.price),
              ProductRating(),
              ProductReview(),
              ProductQnA(),
              RelatedProduct(),
            ],
          ))),
        ),
        BottomBar(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_shopping_cart)),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70.0),
                  child: Text("Buy Now"),
                ))
          ],
        )
      ]),
    );
  }
}
