import 'package:flutter/material.dart';
import 'package:random_color_app/main_page.dart';

/// Main app widget
class App extends StatelessWidget {
  /// Main app widget constructor

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}
