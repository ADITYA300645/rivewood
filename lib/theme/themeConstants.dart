import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  textTheme: const TextTheme(
    titleMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
  ),
  appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.black),
          backgroundColor: MaterialStatePropertyAll(Colors.white))),
  // useMaterial3: true
);
ThemeData dark = ThemeData(
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.black12,
        foregroundColor: Colors.white));
