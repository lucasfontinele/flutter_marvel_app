import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/components/Header/header_view.dart';
import 'package:flutter_marvel_app/components/HeroCard/hero_card_view.dart';
import 'package:flutter_marvel_app/components/ItemsList/items_list_view.dart';
import 'package:flutter_marvel_app/models/hero_model.dart';
import 'package:flutter_marvel_app/repositories/HeroesRepository.dart';
import 'package:flutter_marvel_app/scenes/Error/error_factory.dart';
import 'package:flutter_marvel_app/scenes/HeroDetail/hero_detail_view.dart';
import 'package:flutter_marvel_app/scenes/Loading/loading_factory.dart';
import 'package:flutter_marvel_app/Services/api_service.dart';
import 'package:flutter_marvel_app/components/BottomNavigationBar/bottom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final HeroesRepository heroesRepository =
      HeroesRepository(apiService: ApiService());

  List<HeroModel> marvelCharacters = [];
  List<HeroModel> dcCharacters = [];
  List<HeroModel> animeCharacters = [];
  bool isLoading = false;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchCharacters();
  }

  Future<void> _fetchCharacters() async {
    if (isLoading) return; // Impede múltiplos carregamentos simultâneos

    setState(() {
      isLoading = true;
    });

    try {
      final allCharacters =
          await heroesRepository.fetchCharacters();

      print(allCharacters);

      setState(() {
        marvelCharacters.addAll((allCharacters?.marvel ?? []).cast<HeroModel>());
        dcCharacters.addAll((allCharacters?.dc ?? []).cast<HeroModel>());
        animeCharacters.addAll((allCharacters?.anime ?? []).cast<HeroModel>());
      });
    } catch (e) {
      setState(() {
        hasError = true;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingFactory.createScreen();
    }

    if (hasError) {
      return ErrorFactory.createScreen();
    }

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
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, top: 24),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bem-vindo ao Heroes",
                  style: TextStyle(
                    color: Color(0xFFB7B7C8),
                    fontSize: 14,
                  ),
                ),
                const Text(
                  "Escolha o seu\npersonagem",
                  style: TextStyle(
                    color: Color(0xFF313140),
                    fontSize: 32,
                    fontFamily: "Gilroy-Heavy",
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 48),

                ItemsListView<HeroModel>(
                  label: "Personagens Marvel",
                  items: marvelCharacters,
                  itemBuilder: (context, character) {
                    return HeroCard(
                      heroName: character.name,
                      imagePath: character.image,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HeroDetailView(
                              heroName: character.name,
                              realName: character.name,
                              imageUrl: character.image,
                              description: character.description,
                              heroId: character.id,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 24),

                ItemsListView<HeroModel>(
                  label: "Personagens DC",
                  items: dcCharacters,
                  itemBuilder: (context, character) {
                    return HeroCard(
                      heroName: character.name,
                      imagePath: character.image,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HeroDetailView(
                              heroName: character.name,
                              realName: character.name,
                              imageUrl: character.image,
                              description: character.description,
                              heroId: character.id,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 24),

                ItemsListView<HeroModel>(
                  label: "Personagens Anime",
                  items: animeCharacters,
                  itemBuilder: (context, character) {
                    return HeroCard(
                      heroName: character.name,
                      imagePath: character.image,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HeroDetailView(
                              heroName: character.name,
                              realName: character.name,
                              imageUrl: character.image,
                              description: character.description,
                              heroId: character.id,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
    );
  }
}
