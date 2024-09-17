import 'package:flutter/material.dart';
import './pages/intro_widget.dart';
import "./pages/intro_screen.dart";
import "./pages/habitsPage.dart";
import "./pages/profilePage.dart";
import "./pages/progressPage.dart";
import "./pages/homePage.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroScreen(),
    );
  }
}

