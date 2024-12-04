import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/Scenes/Home/home_factory.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Gilroy"),
      home: HomeFactory.createScreen(),
    );
  }
}
