import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Application')),
      body: Center(
        child: Text(
          "Favorites",
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      ),
    );
  }
}