import 'package:flutter/material.dart';

class AvatarRow extends StatelessWidget {
  const AvatarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/person1.png'),
        ),
        Transform.translate(
          offset: const Offset(-10, 0), // Adjust overlap
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/person2.jpg'),
          ),
        ),
        Transform.translate(
          offset: const Offset(-20, 0), // Adjust overlap
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/person3.jpg'),
          ),
        ),
        Transform.translate(
          offset: const Offset(-30, 0), // Adjust overlap
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.purple,
            child: Text(
              '+4',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
