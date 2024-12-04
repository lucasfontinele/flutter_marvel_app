import 'package:flutter/material.dart';

class HeroDetailView extends StatelessWidget {
  final String heroName;
  final String realName;
  final String imageUrl;
  final String? description;

  const HeroDetailView({
    super.key,
    required this.heroName,
    required this.realName,
    required this.imageUrl,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(heroName, style: const TextStyle(fontFamily: "Gilroy", color: Colors.white, fontSize: 20)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              child: Image.network(imageUrl),
            ),

            const SizedBox(height: 16),

            Text(
              'Nome do herói: $realName',
              style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: "Gilroy"),
            ),

            const SizedBox(height: 8),

            Text(
              description ?? "Não preenchido.",
              style: const TextStyle(fontSize: 14, color: Colors.white, fontFamily: "Gilroy"),
            ),
          ],
        ),
      ),
    );
  }
}
