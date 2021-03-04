import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MaterialApp(home: MovieApp()));
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text(
            'Bat Man API',
            style: TextStyle(letterSpacing: 2),
          )),
          backgroundColor: Colors.orange),
      body: SafeArea(
        child: HomePage(),
      ),
    );
  }
}
