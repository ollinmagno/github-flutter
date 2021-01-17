import 'package:app_github/api/api.dart';
import 'package:app_github/components/card_repository.dart';
import 'package:app_github/models/repository.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API GITHUB'),
      ),
      body: Container(
        child: FutureBuilder(
            future: _api.searchRepository(),
            builder: (context, snapshot) {
              switch(snapshot.connectionState){
                case ConnectionState.none :
                case ConnectionState.waiting:
                  return Center(child: Text("Carregando..."));
                default:
                  if(snapshot.hasError){
                    return Center(child: Text("Erro ao carregar..."));
                  } else {
                    return ListView.builder(
                      itemCount: _api.repositories.length,
                      itemBuilder: (context, index){
                        return Center(child: Text('${_api.repositories.toList()}'),);
                    });
                  }
              }
            }),
      ),

    );
  }
}
