import 'package:cashier_simulator/screens/game_screen.dart';
import 'package:flutter/material.dart';

class GameModesScreen extends StatelessWidget {
  const GameModesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Game Modes',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              _buildModeButton(context, 'Easy', Colors.lightGreen, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GameScreen()),
                );
              }),
              const SizedBox(height: 20),
              _buildModeButton(context,'Hard', Colors.orange, (){}),
              const SizedBox(height: 20),
              _buildModeButton(context,'Endless', Colors.redAccent, (){}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModeButton(BuildContext context, String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
