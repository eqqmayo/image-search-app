import 'dart:convert';

import 'package:image_search_app/data/dto/image_dto.dart';
import 'package:http/http.dart' as http;

class ImageDataSource {
  final String _baseUrl = 'https://pixabay.com/api/?key=';
  final String _key = '44778600-cfe08ce4b2d6f2bb2ce5be47c';

  Future<List<ImageDto>> getImages(String keyword) async {
    final response = await http.get(Uri.parse('$_baseUrl$_key&q=$keyword'));

    if (response.statusCode == 200) {
      final List jsonList = jsonDecode(response.body)['hits'];
      return jsonList.map((e) => ImageDto.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load images.');
    }
  }
}
