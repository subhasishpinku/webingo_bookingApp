import 'package:flutter/material.dart';

class Grid1Screen extends StatelessWidget {
  const Grid1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Application')),
      body: Center(
        child: Text(
          "Grid1Screen",
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      ),
    );
  }
}
