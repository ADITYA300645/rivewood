import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivewood/pages/scrollThroughSuggestionView/scrollThroughSuggestionView.dart';
import 'package:rivewood/pages/orders/ordersView.dart';
import 'package:rivewood/pages/profile/profileView.dart';
import 'package:rivewood/theme/themeProvider.dart';
import 'package:rivewood/utils/BottomNavigationBar/CustomBottomNavigationBar.dart';
import './pages/home/homeView.dart';
import './utils/BottomNavigationBar/BottomNavigationBarProvider.dart'
    as BottomBar;
import 'theme/themeConstants.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var theme = ref.watch(isLight);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: dark,
          theme: light,
          themeMode: theme ? ThemeMode.light : ThemeMode.dark,
          home: MainPage(),
        );
      },
    );
  }
}

List<Widget> _pages = [Home(), ScrollThroughSuggestion(), Orders(), Profile()];

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Stack(fit: StackFit.expand, children: [
        Consumer(builder: (context, ref, child) {
          var currentValue = ref.watch(BottomBar.currentValue);
          return _pages[currentValue];
        }),
        CustomBottomNavigationBar()
      ]),
    );
  }
}
