import 'package:flutter_marvel_app/Services/api_service.dart';

class HeroesRepository {
  final ApiService apiService;

  HeroesRepository({required this.apiService});

  Future<HeroesApiResponse?> fetchCharacters() async {
    final response = await apiService.getCharacters();

    return response.data;
  }
}
