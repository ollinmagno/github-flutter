import 'dart:convert';
import 'package:app_github/models/repository.dart';
import 'package:http/http.dart' as http;

class ApiService {
  List repositories;

  Future<void> searchRepository(name) async {
    String url = 'https://api.github.com/search/repositories?q=$name&page=0&per_page=10';
    var response = await http.get(url);
    var data = json.decode(response.body);
    repositories = ((data['items'] as List).map((e) => Repository.fromJson(e)).toList());
    print(repositories);
    repositories.forEach((element) {
      print(element.name);
    });
  }
  
}