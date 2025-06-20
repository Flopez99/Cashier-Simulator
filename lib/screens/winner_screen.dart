import 'package:flutter/material.dart';

class WinnerScreen extends StatelessWidget {
  const WinnerScreen({super.key, required this.onRestart});

  final double score = 10;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Won!',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Score: \$${score.toStringAsFixed(2)}', //make score
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
          ],
        ),
      ),
    );
  }
}
