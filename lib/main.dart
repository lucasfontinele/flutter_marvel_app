import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/DesignSystem/Components/Header/header_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: SafeArea(
            child: CustomHeader(
              onMenuPressed: () => {
                //
              },
              onSearchPressed: () => {
                //
              },
            )
          ),
        ),
        body: const Center(
          child: Text("Hello world")
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
