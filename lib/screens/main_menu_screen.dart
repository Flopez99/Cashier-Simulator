import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game_modes_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

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
                'Main Menu',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              _buildMenuButton(context, 'Play', Colors.lightGreen, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GameModesScreen()),
                );
              }),
              const SizedBox(height: 20),
              _buildMenuButton(context, 'Settings', Colors.orange, () {
                // TODO: Implement settings
              }),
              const SizedBox(height: 20),
              _buildMenuButton(context, 'Quit', Colors.redAccent, () {
                exit(0);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String text, Color color, VoidCallback onPressed) {
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
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
