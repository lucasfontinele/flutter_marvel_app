import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class MarvelApiService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://gateway.marvel.com/v1/public';

  final String publicKey = "4bc16b8fb7d3664a06fa4037c2aa938c";
  final String privateKey = "dda1c1aacc8e777f1b23413a9f8d76dd16337500";

  String _generateHash(int timestamp) {
    final data = '$timestamp$privateKey$publicKey';
    return md5.convert(utf8.encode(data)).toString();
  }

  Future<Response> getCharacters({int limit = 10, int offset = 0}) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = _generateHash(timestamp);

    final queryParams = {
      'apikey': publicKey,
      'ts': timestamp,
      'hash': hash,
      'limit': limit,
      'offset': offset,
    };

    return await _dio.get('$baseUrl/characters', queryParameters: queryParams);
  }

  Future<Response> getCharacterById(int id) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = _generateHash(timestamp);

    final queryParams = {
      'apikey': publicKey,
      'ts': timestamp,
      'hash': hash,
    };

    return await _dio.get('$baseUrl/characters/$id', queryParameters: queryParams);
  }
}
