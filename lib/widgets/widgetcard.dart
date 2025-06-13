import 'package:flutter/material.dart';
import 'package:test_webingo/widgets/AvatarRow.dart';

class widgetcard extends StatelessWidget {
  const widgetcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Stack(
          clipBehavior: Clip.none, // Allows elements to overflow
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 230,
                width: 350,
                color: Color(0xFFB2A1FF),
              ),
            ),
            Positioned(
              top: -50, // Adjust for overlap
              right: -20, // Align with the container's right edge
              child: Image.asset(
                'assets/logo.png', // Replace with your logo path
                height: 280, // Adjust the size of the logo
                width: 240,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Daily Challenge',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200, // Adjusted width for better layout
                    child: Text(
                      'Do your plan before 09:00 AM',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: AvatarRow(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
