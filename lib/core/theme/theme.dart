import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static Color redColor = const Color(0xffff4656);

  static ThemeData theme = ThemeData(
    primaryColor: redColor,
    appBarTheme: AppBarTheme(
      backgroundColor: redColor,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 23.0,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
