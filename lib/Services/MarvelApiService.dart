import 'package:dio/dio.dart';

class MarvelApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://run.mocky.io/v3';

  Future<Response> getCharacters({int limit = 10, int offset = 0}) async {
    return await _dio.get('$baseUrl/332e393d-cb4f-4022-9d46-efcddc069ed3');
  }
}
