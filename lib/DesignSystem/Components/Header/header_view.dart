import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback onSearchPressed;

  const CustomHeader({
    super.key,
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Heroes',
            style: TextStyle(
              fontSize: 28,
              color: Color(0xFFF2264B),
              fontFamily: 'Gilroy-Heavy',
            ),
          ),
        ],
      ),
    );
  }
}
