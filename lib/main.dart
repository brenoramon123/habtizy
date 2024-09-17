import 'package:flutter/material.dart';
import './pages/intro_widget.dart';
import "./pages/intro_screen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Demo',
      home: const IntroScreen(),
    );
  }
}
