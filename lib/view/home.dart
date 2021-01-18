import 'package:app_github/api/api.dart';
import 'package:app_github/components/card_repository.dart';
import 'package:app_github/components/form_repository.dart';
import 'package:app_github/models/repository.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService _api;
  Repository repository;

  @override
  void initState() {
    _api = ApiService();
    repository = Repository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API GITHUB'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            FormRepository(
              onSearch: _api.searchRepository,
            ),
            SizedBox(height: 20),
            FutureBuilder(
                future: _api.searchRepository('dart'),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(child: Text("Carregando..."));
                    default:
                      if (snapshot.hasError) {
                        return Center(child: Text("Erro ao carregar..."));
                      } else {
                        return Expanded(
                          child: Container(
                              child: CardRepository(
                                  repositories: _api.repositories)),
                        );
                      }
                  }
                }),
          ],
        ),
      ),
    );
  }
}
