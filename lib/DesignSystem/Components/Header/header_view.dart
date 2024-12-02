import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback onSearchPressed;

  const CustomHeader({super.key, 
    required this.onMenuPressed,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: onMenuPressed,
          ),

          Image.asset("assets/logo.png", height: 70,),

          IconButton(
            icon: const Icon(Icons.search),
            onPressed: onSearchPressed,
          ),
        ],
      ),
    );
  }
}
