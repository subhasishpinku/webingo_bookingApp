import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;

  const CircleIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3), 
      decoration: BoxDecoration(
        color: Color(0xFFD687DA), 

        shape: BoxShape.circle,
      ),
      child: Container(
        padding: EdgeInsets.all(5), 
        decoration: BoxDecoration(
          color: Color(0xFFD687DA), 
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
