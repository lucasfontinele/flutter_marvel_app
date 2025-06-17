import 'package:flutter/material.dart';
import 'package:flutter_marvel_app/models/hero_model.dart';

class HeroProvider with ChangeNotifier {
  List<HeroModel> _heroes = [];

  List<HeroModel> get heroes => _heroes;

  void setHeroes(List<HeroModel> heroes) {
    _heroes = heroes;
    notifyListeners();
  }

  void addHero(HeroModel hero) {
    _heroes.add(hero);
    notifyListeners();
  }

  void removeHero(int heroId) {
    _heroes.removeWhere((hero) => hero.id == heroId);
    notifyListeners();
  }

  void clearHeroes() {
    _heroes.clear();
    notifyListeners();
  }

  bool isHeroFavorite(int id) {
    return _heroes.any((hero) => hero.id == id);
  }
}