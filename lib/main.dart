import 'package:flutter/material.dart';
import 'package:valorant_search/core/theme/theme.dart';
import 'package:valorant_search/views/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeView(),
      theme: CustomTheme.theme,
    );
  }
}
