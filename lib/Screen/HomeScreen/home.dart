import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_webingo/Screen/ChooseSeatsScreen/ChooseSeats.dart';
import 'package:test_webingo/Screen/HomeScreen/HomeProvider.dart';
import 'package:test_webingo/BottomBar/BottomBarSecond.dart';
import 'package:test_webingo/Screen/HomeScreen/model/Plan.dart';
import 'package:test_webingo/Screen/HomeScreen/widgets/CircleIcon.dart';
import 'package:test_webingo/Screen/HomeScreen/widgets/EditPlanDialog.dart';
import 'package:test_webingo/Screen/HomeScreen/widgets/widgetcard.dart';
import 'package:test_webingo/style/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 3;
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(
      context,
      listen: false,
    ).fetchPlans("2025-11-25"); // use dynamic date if needed
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

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
                    itemCount: homeProvider.days.length,
                    itemBuilder: (context, index) {
                      final isSelected = homeProvider.selectedIndex == index;
                      return GestureDetector(
                        onTap: () => homeProvider.selectDay(index),
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
                                homeProvider.days[index]["day"],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                homeProvider.days[index]["date"].toString(),
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
                                child: Text("Medium"),
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
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                if (homeProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (homeProvider.plans.isEmpty) {
                  return const Center(child: Text("No plans available"));
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: homeProvider.plans.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75, // Adjust for height/width ratio
                  ),
                  itemBuilder: (context, index) {
                    final plan = homeProvider.plans[index];
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => EditPlanDialog(plan: plan),
                        );
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.getPlanColor(plan.level),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Level tag
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(plan.level),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                plan.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "${plan.date}\n${plan.time}\nRoom: ${plan.room}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 16,
                                    backgroundImage: AssetImage(
                                      'assets/profile.jpg',
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      "Trainer\n${plan.trainer}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
