import 'package:flutter/material.dart';
import 'package:random_colors/ui/widgets/home_screen.dart';

/// Random colors application widget
class RandomColorsApp extends StatelessWidget {
  /// Random colors application widget constructor
  const RandomColorsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
