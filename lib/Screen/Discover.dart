import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_webingo/widgets/CardItem.dart';
import 'package:test_webingo/widgets/ItemProvider.dart';
import 'package:test_webingo/widgets/SearchBarGlass.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final items = itemProvider.items;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 10, top: 50),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'assets/image1.png',
                        height: 280,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  right: 20,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.near_me, color: Colors.white, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            'Norway',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          'Hey, Martin! Tell us where you want to go',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SearchBarGlass(), // Custom widget
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Text(
                'The most relevant',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8.0),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CardItem(
                    imageUrl: items[index]['image']!,
                    text: items[index]['text']!,
                    size: 300,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Text(
                'Discover new places',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.16,
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return CardItem2(
                      imageUrl: items[index]['image']!,
                      text: items[index]['text']!,
                      size: 120,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem2 extends StatelessWidget {
  final String imageUrl;
  final String text;
  final double size;
  const CardItem2({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: size, // Adjust width
        child: Stack(
          children: [
            // Card with dynamic image
            ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.asset(
                imageUrl,
                width: size,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Overlay text
          ],
        ),
      ),
    );
  }
}
