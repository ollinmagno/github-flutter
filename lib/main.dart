import 'package:app_github/view/home.dart';
import 'package:flutter/material.dart';

void main() =>
  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'github api',
      home: Home(),
    );
  }
}