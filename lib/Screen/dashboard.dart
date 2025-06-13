import 'package:flutter/material.dart';
import 'package:test_webingo/Screen/chart_screen.dart';
import 'package:test_webingo/Screen/grid1_screen.dart';
import 'package:test_webingo/Screen/home.dart';
import 'package:test_webingo/Screen/profile.dart';
import 'package:test_webingo/widgets/BottomBar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Dashboard> {
  int pageIndex = 0;
  final List<Widget> pages = [
    const Home(),
    const Grid1Screen(),
    const ChartScreen(),
    const Profile(),
  ];

  void _onPageSelected(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(
                radius: 16,
                backgroundImage: Image.asset('assets/profile.jpg').image,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Column(
                  children: [
                    const Text(
                      "Hello Sandra",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Today 25 Nov",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(246, 246, 246, 255),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 25, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
          ),
        ),
        elevation: 0.00,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: BottomBar(
        pageIndex: pageIndex,
        onPageSelected: _onPageSelected,
      ),
    );
  }
}
