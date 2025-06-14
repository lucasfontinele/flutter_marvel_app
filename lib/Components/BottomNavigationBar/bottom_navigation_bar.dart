import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            color: Colors.brown,
            icon: const Icon(Icons.home),
            onPressed: () {
              // Ação para o botão Home
            },
          ),
          IconButton(
            color: Colors.brown,
            icon: const Icon(Icons.search),
            onPressed: () {
              // Ação para o botão Home
            },
          ),
          IconButton(
            color: Colors.brown,
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Ação para o botão Search
            },
          ),
        ],
      ),
    );
  }
}
