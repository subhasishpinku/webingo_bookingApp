import 'package:flutter/material.dart';

class SeatProvider with ChangeNotifier {
  List<List<int>> seatMap = [
    [0, 0, 2, 0, 1],
    [1, 0, 0, 2, 2],
    [2, 1, 0, 0, 0],
    [0, 0, 1, 1, 0],
    [0, 0, 1, 1, 0],
    [0, 0, 2, 0, 1],
    [1, 0, 0, 2, 2],
    [2, 1, 0, 0, 0],
    [0, 0, 1, 1, 0],
    [0, 0, 1, 1, 0],
  ];

  double seatPrice = 35.50;
  int selectedSeats = 0;
  List<String> selectedRowsAndSeats = [];

  void toggleSeatSelection(int row, int col) {
    if (seatMap[row][col] == 0) {
      // Select the seat
      seatMap[row][col] = 1;
      selectedSeats++;
      selectedRowsAndSeats.add("Row ${row + 1}, Seat ${col + 1}");
    } else if (seatMap[row][col] == 1) {
      // Deselect the seat
      seatMap[row][col] = 0;
      selectedSeats--;
      selectedRowsAndSeats.remove("Row ${row + 1}, Seat ${col + 1}");
    }
    notifyListeners();
  }
}
