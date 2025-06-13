import 'package:flutter/material.dart';

class AppColors {
  static Color getPlanColor(String level) {
    switch (level.toLowerCase()) {
      case 'light':
        return const Color(0xFFA8CCFE);
      case 'medium':
        return const Color(0xFFFFBE58);
      case 'advanced':
        return const Color(0xFFFB9DFD);
      default:
        return Colors.grey;
    }
  }
}
