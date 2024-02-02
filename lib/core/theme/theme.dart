import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static Color redColor = const Color(0xffff4656);
  static Color blackColor = const Color(0xff11222c);

  static ThemeData theme = ThemeData(
    primaryColor: redColor,
    // brightness: Brightness.dark,
    // scaffoldBackgroundColor: blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: redColor,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 23.0,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
