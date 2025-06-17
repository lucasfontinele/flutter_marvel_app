import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/providers/hero_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_marvel_app/scenes/Home/home_factory.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HeroProvider()),
      ],
      child: const MainApp(),
    ),
  );
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
