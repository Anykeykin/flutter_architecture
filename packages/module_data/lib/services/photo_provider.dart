import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:module_model/module_model.dart';

class PhotoProvider {

  Future<List<Photos>> getPhotos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if(response.statusCode == 200) {
      final List<dynamic> photoJson =  jsonDecode(response.body);
      return photoJson.map((json) => Photos.fromJson(json)).toList();
    } else {
      throw Exception('Ошибка');
    }
  }
}