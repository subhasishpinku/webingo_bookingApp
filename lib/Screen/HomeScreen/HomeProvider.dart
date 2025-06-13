import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _days = [
    {"day": "Sun", "date": 22},
    {"day": "Mon", "date": 23},
    {"day": "Tue", "date": 24},
    {"day": "Wed", "date": 25},
    {"day": "Thu", "date": 26},
    {"day": "Fri", "date": 27},
    {"day": "Sat", "date": 28},
  ];

  int _selectedIndex = 3; 

  List<Map<String, dynamic>> get days => _days;
  int get selectedIndex => _selectedIndex;

  void selectDay(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
