import 'package:app_github/models/repository.dart';
import 'package:flutter/material.dart';

class CardRepository extends StatelessWidget {  
  final List<Repository> repositories;

  const CardRepository({this.repositories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: repositories.length,
      itemBuilder: (context, int index){
        return Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: ListTile(
                  title: Text('${repositories[index].name}'),
                  subtitle: Text('${repositories[index].description}'),
                ),
              ),
              ButtonBar(
                children: [
                  FlatButton(
                    onPressed: (){},
                    child: Text('Abrir repositório'),
                  ),
                ],
              ),
            ],
          ),
          elevation: 3.0,
        );
      }
    );
  }
}