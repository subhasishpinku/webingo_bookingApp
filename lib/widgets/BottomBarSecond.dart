import 'package:flutter/material.dart';
import 'package:test_webingo/Screen/Booking.dart';
import 'package:test_webingo/Screen/Discover.dart';
import 'package:test_webingo/Screen/Favorites.dart';
import 'package:test_webingo/Screen/Message.dart';

class BottomBarSecond extends StatefulWidget {
  const BottomBarSecond({super.key});

  @override
  State<BottomBarSecond> createState() => _BottomBarSecondState();
}

class _BottomBarSecondState extends State<BottomBarSecond> {
  int _subIndex = 0;

  final List<Widget> _subPages = [
    const Discover(),
    const Favorites(),
    const Booking(),
    const Message(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _subPages[_subIndex],
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),

            child: BottomNavigationBar(
              currentIndex: _subIndex,
              onTap: (index) {
                setState(() {
                  _subIndex = index;
                });
              },
              backgroundColor: Colors.black, 
              selectedItemColor: Colors.white, 
              unselectedItemColor: Colors.grey, 
              type: BottomNavigationBarType.fixed, 
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.travel_explore),
                  label: 'Discover',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book_online),
                  label: 'Bookings',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Messages',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
