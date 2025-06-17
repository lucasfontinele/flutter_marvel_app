import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/models/hero_model.dart';
import 'package:flutter_marvel_app/providers/hero_provider.dart';
import 'package:provider/provider.dart';

class HeroDetailView extends StatelessWidget {
  final int heroId;
  final String heroName;
  final String realName;
  final String imageUrl;
  final String? description;
  final String? mainCharacteristics;

  const HeroDetailView({
    super.key,
    required this.heroId,
    required this.heroName,
    required this.realName,
    required this.imageUrl,
    this.description,
    this.mainCharacteristics,
  });

  @override
  Widget build(BuildContext context) {
    final heroProvider = Provider.of<HeroProvider>(context);
    final isFavorite = heroProvider.isHeroFavorite(heroId);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(heroName, style: const TextStyle(fontFamily: "Gilroy", color: Colors.white, fontSize: 20)),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          final hero = HeroModel(
            id: heroId,
            name: heroName,
            image: imageUrl,
            description: description ?? "",
            mainCharacteristics: mainCharacteristics ?? ""
          );
          if (isFavorite) {
            heroProvider.removeHero(heroId);
          } else {
            heroProvider.addHero(hero);
          }
        },
        icon: Icon(
          Icons.favorite,
          color: isFavorite ? Colors.red : Colors.white,
          size: 30,
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
