import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/components/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:flutter_marvel_app/components/Header/header_view.dart';
import 'package:flutter_marvel_app/components/HeroCard/hero_card_view.dart';
import 'package:flutter_marvel_app/providers/hero_provider.dart';
import 'package:flutter_marvel_app/scenes/HeroDetail/hero_detail_view.dart';
import 'package:flutter_marvel_app/scenes/Home/home_factory.dart';
import 'package:provider/provider.dart';

class FavoritesView<T> extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    final heroProvider = Provider.of<HeroProvider>(context);
    final items = heroProvider.heroes;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: CustomHeader(
            onMenuPressed: () {},
            onSearchPressed: () {},
          ),
        ),
      ),
       bottomNavigationBar: BottomBar(
        onPressHome: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeFactory.createScreen(),
            ),
          );
        },
        onPressFavorites: () {},
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 24, top: 24),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Favoritos",
                  style: TextStyle(
                    color: Color(0xFF313140),
                    fontSize: 32,
                    fontFamily: "Gilroy-Heavy",
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: HeroCard(
                          heroName: item.name,
                          imagePath: item.image,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HeroDetailView(
                                  heroName: item.name,
                                  realName: item.name,
                                  imageUrl: item.image,
                                  description: item.description,
                                  heroId: item.id,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
