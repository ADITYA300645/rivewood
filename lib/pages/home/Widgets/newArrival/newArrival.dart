import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivewood/core/Models/Product.dart';
import 'package:rivewood/pages/ProductPage/ProductPageView.dart';
import 'package:rivewood/pages/home/Widgets/newArrival/newArrivalController.dart';
import '../../../../core/controller/ProductProvider.dart';
import 'package:rivewood/constants/Constants.dart' as Constants;
import 'package:rivewood/pages/home/homeView.dart';
import 'package:rivewood/pages/profile/widgets/SettingOptons/SettingOptions.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrival",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_right_alt))
            ],
          ),
        ),
        FutureBuilder(
          future: getNewArrivals(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const LoadingCard();
            }
            return Container(
              height: 350,
              child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                      child: Card(
                        child: Consumer(
                          builder: (context, ref, child) {
                            AsyncValue<Product> product = ref
                                .watch(productProvider(snapshot.data![index]));
                            return product.when(
                              data: (infoSnapshot) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        settings: const RouteSettings(
                                            name: "Product"),
                                        builder: (context) {
                                          return ProductPage(
                                              product: infoSnapshot);
                                        },
                                      ));
                                },
                                child: Container(
                                    // width: 250,
                                    child: Image.network(
                                  //todo Look For Image Behaviour
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  fit: BoxFit.cover,
                                  Constants.productImageUrl(
                                      infoSnapshot.id ?? "noImage", 0),
                                )),
                              ),
                              error: (err, stack) => const Center(
                                  child: Text("Some thing went wrong")),
                              loading: () => const Center(child: LoadingCard()),
                            );
                          },
                        ),
                      ),
                    );
                  }),
            );
          },
        )
      ],
    );
  }
}

class LoadingCard extends StatelessWidget {
  const LoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8),
          child: Card(
            child: Container(
                width: 280, child: const Center(child: Text("loading..."))),
          ),
        ),
      ),
    );
  }
}
