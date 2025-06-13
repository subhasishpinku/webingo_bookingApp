import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Application')),
      body: Center(
        child: Text(
          "Message",
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      ),
    );
  }
}
