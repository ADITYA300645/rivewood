import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './BottomNavigationBarProvider.dart' as BottomProvider;

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentScreen = ref.watch(BottomProvider.currentValue);
    return Positioned(
        bottom: 10,
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            // color: Colors.blue,
            elevation: 11,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                (currentScreen == 0)
                    ? IconButton(onPressed: () {}, icon: Icon(Icons.home))
                    : IconButton(
                        onPressed: () {
                          BottomProvider.jumpTo(ref, 0);
                        },
                        icon: Icon(Icons.home_outlined)),
                (currentScreen == 1)
                    ? IconButton(onPressed: () {}, icon: Icon(Icons.gite_sharp))
                    : IconButton(
                        onPressed: () {
                          BottomProvider.jumpTo(ref, 1);
                        },
                        // todo Make Better Icon
                        icon: Icon(Icons.gite)),
                (currentScreen == 2)
                    ? IconButton(
                        onPressed: () {}, icon: Icon(Icons.shopping_bag))
                    : IconButton(
                        onPressed: () {
                          BottomProvider.jumpTo(ref, 2);
                        },
                        icon: Icon(Icons.shopping_bag_outlined)),
                (currentScreen == 3)
                    ? IconButton(
                        onPressed: () {}, icon: Icon(Icons.manage_accounts))
                    : IconButton(
                        onPressed: () {
                          BottomProvider.jumpTo(ref, 3);
                        },
                        icon: Icon(Icons.manage_accounts_outlined)),
              ],
            ),
          ),
        ));
  }
}
