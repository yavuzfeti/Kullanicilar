import 'package:flutter/material.dart';
import 'ana_sayfa.dart';

void main()=>runApp(app());

class app extends StatefulWidget {

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => ana_sayfa(),
      },
    );
  }
}
