import 'package:dio/dio.dart';
import 'package:flutter_marvel_app/models/heroes_api_response.dart';

class ApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://run.mocky.io/v3';

  Future<HeroesApiResponse> getCharacters({int limit = 10, int offset = 0}) async {
    final response = await _dio.get('$baseUrl/332e393d-cb4f-4022-9d46-efcddc069ed3');

    if (response.statusCode == 200) {
      return HeroesApiResponse.fromJson(response.data);
    } else {
      throw Exception('Erro ao carregar heróis: ${response.statusMessage}');
    }
  }
}
