import 'package:dio/dio.dart';
import 'package:test_webingo/Screen/HomeScreen/model/Plan.dart';

class HomeService {
  final Dio _dio = Dio();

  Future<List<Plan>> fetchPlans(String date) async {
    try {
      final response = await _dio.get(
        'https://fitness.wigian.in/user_plan_api.php',
        queryParameters: {'date': date},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['plans'] != null) {
          return (data['plans'] as List)
              .map((plan) => Plan.fromJson(plan))
              .toList();
        }
      }
    } catch (e) {
      print("PlanService error: $e");
    }

    return [];
  }

  Future<bool> updatePlanAPI(Map<String, dynamic> updatedPlan) async {
    try {
      final response = await _dio.post(
        "https://fitness.wigian.in/user_plan_api.php",
        data: {
          "date": "2025-11-25", // Replace with dynamic date if needed
          "plans": [updatedPlan],
        },
      );

      if (response.statusCode == 200) {
        print("Plan updated successfully!");
        return true;
      } else {
        print("Update failed: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("API error: $e");
      return false;
    }
  }
}
