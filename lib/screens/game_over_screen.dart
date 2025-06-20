import 'package:cashier_simulator/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key, required this.score, required this.onRestart});

  final int score;
  final VoidCallback onRestart;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Game Over',
              style: TextStyle(
                fontSize: 40,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Score: ${score}', //make score
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: onRestart,
              child: Text('Restart'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MainMenuScreen()),
                );
              },
              child: Text('Main Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
