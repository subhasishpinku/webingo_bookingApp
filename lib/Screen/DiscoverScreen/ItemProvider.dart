import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  final List<Map<String, String>> _items = [
    {"image": "assets/image1.png", "text": "Item 1"},
    {"image": "assets/image1.png", "text": "Item 2"},
    {"image": "assets/image2.png", "text": "Item 3"},
  ];

  List<Map<String, String>> get items => _items;

  // void addItem(Map<String, String> newItem) {
  //   _items.add(newItem);
  //   notifyListeners(); // This triggers UI update
  // }

  // void removeItem(int index) {
  //   _items.removeAt(index);
  //   notifyListeners();
  // }
}
