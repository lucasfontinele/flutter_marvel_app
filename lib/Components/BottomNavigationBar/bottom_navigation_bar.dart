import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final VoidCallback onPressHome;

  final VoidCallback onPressFavorites;

  const BottomBar({
    super.key,
    required this.onPressHome,
    required this.onPressFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            color: Colors.brown,
            icon: const Icon(Icons.home),
            onPressed: onPressHome,
          ),
          IconButton(
            color: Colors.brown,
            icon: const Icon(Icons.favorite),
            onPressed: onPressFavorites,
          ),
        ],
      ),
    );
  }
}
