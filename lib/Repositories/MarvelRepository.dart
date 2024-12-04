import 'package:flutter_marvel_app/Models/ApiResponseModel.dart';
import 'package:flutter_marvel_app/Models/CharacterModel.dart';
import 'package:flutter_marvel_app/Services/MarvelApiService.dart';

class MarvelRepository {
  final MarvelApiService apiService;

  MarvelRepository({required this.apiService});

  Future<List<CharacterModel>> fetchCharacters({int limit = 10, int offset = 0}) async {
    final response = await apiService.getCharacters(limit: limit, offset: offset);
    final apiResponse = ApiResponseModel<CharacterModel>.fromJson(
      response.data,
      (json) => CharacterModel.fromJson(json),
    );

    return apiResponse.results;
  }

  Future<CharacterModel> fetchCharacterById(int id) async {
    final response = await apiService.getCharacterById(id);
    final apiResponse = ApiResponseModel<CharacterModel>.fromJson(
      response.data,
      (json) => CharacterModel.fromJson(json),
    );

    return apiResponse.results.first;
  }
}
