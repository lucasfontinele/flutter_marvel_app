import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/components/MainTabView/main_tab_view.dart';
import 'package:flutter_marvel_app/providers/hero_provider.dart';
import 'package:provider/provider.dart';

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
      home: const MainTabView(),
    );
  }
}
