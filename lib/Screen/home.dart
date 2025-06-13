import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_webingo/Screen/ChooseSeats.dart';
import 'package:test_webingo/Screen/DaysProvider.dart';
import 'package:test_webingo/widgets/BottomBarSecond.dart';
import 'package:test_webingo/widgets/CircleIcon.dart';
import 'package:test_webingo/widgets/widgetcard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    final daysProvider = Provider.of<DaysProvider>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widgetcard(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: daysProvider.days.length,
                    itemBuilder: (context, index) {
                      final isSelected = daysProvider.selectedIndex == index;
                      return GestureDetector(
                        onTap: () => daysProvider.selectDay(index),
                        child: Container(
                          width: 60,
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ]
                                : null,
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.circle,
                                size: 6,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                daysProvider.days[index]["day"],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                daysProvider.days[index]["date"].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Text(
                'Your Plan',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomBarSecond(),
                          ),
                        );
                      },
                      child: Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.8, // 80% of the screen width
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFBE58),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Level tag
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text("Medium"),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "Yoga Group",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: const Text(
                                "25 Nov.\n14:00–15:00\nA5 room",
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                bottom: 20,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundImage: Image.asset(
                                      'assets/profile.jpg',
                                    ).image,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text("Trainer\nTiffany Way"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChooseSeats(),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth * 0.8, // 80% of the screen width
                            height: 200,
                            decoration: BoxDecoration(
                              color: Color(0xFFA8CCFE),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // Level
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: <Widget>[
                                Positioned(
                                  top: 20,
                                  left: 20,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text("Light"),
                                  ),
                                ),
                                Positioned(
                                  top: 60,
                                  left: 20,
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Balance",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        "28 Nov.\n18:00–19:30\nA2 room",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 2,
                                  left: 60,
                                  child: Image.asset(
                                    'assets/balance.png', // Replace with actual image
                                    height: 140,
                                  ),
                                ),
                              ],
                            ),

                            // const Spacer(),
                          ),
                        ),

                        SizedBox(height: 5),
                        Container(
                          width: screenWidth * 0.8, // 80% of the screen width
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFFB9DFD),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              CircleIcon(icon: Icons.camera_alt),
                              CircleIcon(icon: Icons.play_circle_fill),
                              CircleIcon(icon: Icons.alternate_email),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
