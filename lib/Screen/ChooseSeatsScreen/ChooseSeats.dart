import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_webingo/Screen/ChooseSeatsScreen/seat_provider.dart';

class ChooseSeats extends StatefulWidget {
  const ChooseSeats({super.key});

  @override
  State<ChooseSeats> createState() => _ChooseSeatsState();
}

class _ChooseSeatsState extends State<ChooseSeats> {
  @override
  Widget build(BuildContext context) {
    final seatProvider = Provider.of<SeatProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F5F2),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: Image.asset('assets/profile.jpg').image,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: const Text(
                        "Samantha",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: CircleAvatar(
                          backgroundColor: const Color.fromARGB(
                            246,
                            246,
                            246,
                            255,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      "Choose Seats",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 80, right: 80),
                  child: GridView.builder(
                    itemCount:
                        seatProvider.seatMap.length *
                        seatProvider.seatMap[0].length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                    itemBuilder: (context, index) {
                      final row = index ~/ seatProvider.seatMap[0].length;
                      final col = index % seatProvider.seatMap[0].length;
                      final status = seatProvider.seatMap[row][col];

                      return GestureDetector(
                        onTap: () {
                          if (status != 2) {
                            seatProvider.toggleSeatSelection(row, col);
                          }
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: status == 0
                              ? Colors.grey[300]
                              : status == 1
                              ? const Color(0xFFAC94F6)
                              : Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    legendItem(Color(0xFFAC94F6), "Selected"),
                    legendItem(Colors.black, "Reserved"),
                    legendItem(Colors.grey[300]!, "Available"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Container(
                  height: 250,
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 30,
                          ),
                          const Text(
                            "Cinema Max",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "12/06/2025",
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  "Date",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  "21:55",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Hour",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  context.watch<SeatProvider>().selectedSeats >
                                          0
                                      ? "${context.watch<SeatProvider>().selectedSeats}"
                                      : "No seats",
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  "Seats",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  seatProvider.selectedRowsAndSeats.isNotEmpty
                                      ? seatProvider.selectedRowsAndSeats
                                            .map((seat) => seat[4])
                                            .toSet()
                                            .join(", ")
                                      : "No Row",
                                  style: const TextStyle(color: Colors.white70),
                                ),

                                Text(
                                  "Row",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price\n\$${(seatProvider.selectedSeats * seatProvider.seatPrice).toStringAsFixed(2)}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFAC94F6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 15,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Buy",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget legendItem(Color color, String text) {
    return Row(
      children: [
        CircleAvatar(radius: 10, backgroundColor: color),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
