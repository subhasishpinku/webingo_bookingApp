import 'package:flutter/material.dart';
import 'package:test_webingo/Screen/HomeScreen/Home_Service/homeservice.dart';
import 'package:test_webingo/Screen/HomeScreen/model/Plan.dart';

class HomeProvider with ChangeNotifier {
  final HomeService _planService = HomeService();
  List<Plan> _plans = [];
    List<Plan> _plansUpdate = [];

  bool _isLoading = false;
  List<Plan> get plans => _plans;
  bool get isLoading => _isLoading;
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

  Future<void> fetchPlans(String date) async {
    _isLoading = true;
    notifyListeners();

    _plans = await _planService.fetchPlans(date);
    for (var plan in _plans) {
      print(plan.level);
    }
    _isLoading = false;
    notifyListeners();
  }

Future<void> updatePlans(Map<String, dynamic> updatedPlan) async {
  _isLoading = true;
  notifyListeners();

  bool success = await _planService.updatePlanAPI(updatedPlan);

  if (success) {
    await fetchPlans("2025-11-25");
  }

  _isLoading = false;
  notifyListeners();
}


}
