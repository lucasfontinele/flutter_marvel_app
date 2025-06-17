import 'package:dio/dio.dart';

class Hero {
  final int id;
  final String name;
  final String description;
  final String image;
  final String mainCharacteristics;

  Hero({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.mainCharacteristics,
  });

  factory Hero.fromJson(Map<String, dynamic> json) {
    return Hero(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      mainCharacteristics: json['main_characteristics'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'main_characteristics': mainCharacteristics,
    };
  }
}

class HeroesApiResponse {
  final List<Hero> marvel;
  final List<Hero> dc;
  final List<Hero> anime;

  HeroesApiResponse({
    required this.marvel,
    required this.dc,
    required this.anime,
  });

  factory HeroesApiResponse.fromJson(Map<String, dynamic> json) {
    return HeroesApiResponse(
      marvel: (json['marvel'] as List).map((e) => Hero.fromJson(e)).toList(),
      dc: (json['dc'] as List).map((e) => Hero.fromJson(e)).toList(),
      anime: (json['anime'] as List).map((e) => Hero.fromJson(e)).toList(),
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

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://run.mocky.io/v3';

  Future<Response<HeroesApiResponse>> getCharacters({int limit = 10, int offset = 0}) async {
    return await _dio.get('$baseUrl/332e393d-cb4f-4022-9d46-efcddc069ed3');
  }
}
