import 'hero_model.dart';

class HeroesApiResponse {
  final List<HeroModel> marvel;
  final List<HeroModel> dc;
  final List<HeroModel> anime;

  HeroesApiResponse({
    required this.marvel,
    required this.dc,
    required this.anime,
  });

  factory HeroesApiResponse.fromJson(Map<String, dynamic> json) {
    return HeroesApiResponse(
      marvel: (json['marvel'] as List).map((e) => HeroModel.fromJson(e)).toList(),
      dc: (json['dc'] as List).map((e) => HeroModel.fromJson(e)).toList(),
      anime: (json['anime'] as List).map((e) => HeroModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'marvel': marvel.map((e) => e.toJson()).toList(),
      'dc': dc.map((e) => e.toJson()).toList(),
      'anime': anime.map((e) => e.toJson()).toList(),
    };
  }
}
