import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_color_app/constants.dart';

/// Main page widget
class MainPage extends StatefulWidget {
  /// Main page widget constructor
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _backgroundColor = Colors.white;

  void _generateNewRandomColor() {
    setState(() {
      _backgroundColor =
          Color(Random().nextInt(Constants.maxInt16)).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: InkWell(
        onTap: _generateNewRandomColor,
        child: Center(
          child: Text(
            'Hello there',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
