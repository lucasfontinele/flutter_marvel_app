import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/Components/Header/header_view.dart';
import 'package:flutter_marvel_app/Components/HeroCard/hero_card_view.dart';
import 'package:flutter_marvel_app/Components/ItemsList/items_list_view.dart';
import 'package:flutter_marvel_app/Models/CharacterModel.dart';
import 'package:flutter_marvel_app/Repositories/HeroesRepository.dart';
import 'package:flutter_marvel_app/Scenes/Error/error_factory.dart';
import 'package:flutter_marvel_app/Scenes/HeroDetail/hero_detail_view.dart';
import 'package:flutter_marvel_app/Scenes/Loading/loading_factory.dart';
import 'package:flutter_marvel_app/Services/api_service.dart';
import 'package:flutter_marvel_app/Components/BottomNavigationBar/bottom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final HeroesRepository heroesRepository =
      HeroesRepository(apiService: ApiService());

  List<CharacterModel> marvelCharacters = [];
  List<CharacterModel> dcCharacters = [];
  List<CharacterModel> animeCharacters = [];
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

      setState(() {
        marvelCharacters.addAll((allCharacters?.marvel ?? []).cast<CharacterModel>());
        dcCharacters.addAll((allCharacters?.dc ?? []).cast<CharacterModel>());
        animeCharacters.addAll((allCharacters?.anime ?? []).cast<CharacterModel>());
      });
    } catch (e) {
      print(e);

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
      body: RefreshIndicator(
          child: Container(
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
                    ItemsListView<CharacterModel>(
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
          onRefresh: () async {}),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
    );
  }
}
