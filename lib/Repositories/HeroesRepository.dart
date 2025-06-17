import 'package:flutter_marvel_app/Models/ApiResponseModel.dart';
import 'package:flutter_marvel_app/Models/CharacterModel.dart';
import 'package:flutter_marvel_app/Services/MarvelApiService.dart';

class HeroesRepository {
  final MarvelApiService apiService;

  HeroesRepository({required this.apiService});

  Future<List<CharacterModel>> fetchCharacters() async {
    final response = await apiService.getCharacters();
    final apiResponse = ApiResponseModel<CharacterModel>.fromJson(
      response.data,
      (json) => CharacterModel.fromJson(json),
    );

    return apiResponse.results;
  }
}
