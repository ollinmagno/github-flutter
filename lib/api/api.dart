import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String url = 'https://api.github.com/search/repositories?q=flutter&page=0&per_page=10';
  List repositories;

  Future<void> searchRepository() async {
    var response = await http.get(url);
    repositories = json.decode(response.body)['items'];
    
    print(repositories);
    //_repositories = ((data['items'] as List).map((e) => Repository.fromJson(e)).toList());
  }
  
}