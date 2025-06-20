import 'package:cashier_simulator/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'screens/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cashier Simulator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MainMenuScreen(),
    );
  }
}


