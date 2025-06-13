import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_webingo/Screen/HomeScreen/HomeProvider.dart';
import 'package:test_webingo/Screen/dashboard.dart';
import 'package:test_webingo/Screen/ChooseSeatsScreen/seat_provider.dart';
import 'package:test_webingo/Screen/DiscoverScreen/ItemProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => SeatProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Dashboard(),
    );
  }
}
