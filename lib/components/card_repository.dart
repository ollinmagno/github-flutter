import 'package:app_github/models/repository.dart';
import 'package:flutter/material.dart';

class CardRepository extends StatelessWidget {
  final Repository repository;
  const CardRepository(this.repository);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(repository.name),
          subtitle: Text(repository.description),
        ),
      ),
    );
  }
}