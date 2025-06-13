import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Application')),
      body: Center(
        child: Text(
          "Booking",
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      ),
    );
  }
}
