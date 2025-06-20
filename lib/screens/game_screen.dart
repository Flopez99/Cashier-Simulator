import 'dart:async';
import 'dart:math';
import 'package:cashier_simulator/screens/game_over_screen.dart';
import 'package:cashier_simulator/components/cashier.dart';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}
 
class _GameScreenState extends State<GameScreen> {
  final player = AudioPlayer();

  double _counter = 0.0;
  double _change = (Random().nextDouble() * 1000.0);
  Timer? _timer;
  int _seconds = 40;
  int _score = 0;


  @override
  void initState(){
    super.initState();
    _startTimer();
    _preloadSounds();
  }

  void _preloadSounds() async {
    await player.setSource(AssetSource('sounds/reset.mp3'));
    await player.setSource(AssetSource('sounds/cash_selected.mp3'));
    await player.setSource(AssetSource('sounds/coin_selected.mp3'));
    await player.setSource(AssetSource('sounds/cashier.mp3'));
  }

  void _startTimer(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {
        if(_seconds > 0){
          _seconds--;
        }else{
          _timer?.cancel();
          //show game over screen with stats
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GameOverScreen(
              score: _score,
              onRestart: (){
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const GameScreen()),
                );
              }
            )
          )
        );
      }
    });
  });
}

  @override
  void dispose() {
    _timer?.cancel(); // Always cancel timers when the widget is disposed
    super.dispose();
  }

  void _restartCount(){
    setState(() {
      _counter = 0;
      player.play(AssetSource('sounds/reset.mp3'), volume: .3);

    });
  }
 
  void _incrementCounter(double amount) {
    setState(() {
          
      if (amount >= 1.0) {
        player.play(AssetSource('sounds/cash_selected.mp3'));
      } else {
        player.play(AssetSource('sounds/coin_selected.mp3'));
      }   
    

      _counter += amount;
      if (_counter.toStringAsFixed(2) == _change.toStringAsFixed(2)){
        player.play(AssetSource('sounds/cashier.mp3'));
        _score++;    
        _change = Random().nextDouble() * 1000.0;
        _counter = 0.0;
        _seconds += 10;
      }
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, //Change color here!
      ),
      body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Top row: Time and Score
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time: ${_seconds}s',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Score: $_score',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Change target
              Text(
                'The change is: \$${_change.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 60),

              // Current counter amount
              Text(
                '\$${_counter.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // Restart button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: _restartCount,
                child: const Text('Restart'),
              ),

              const SizedBox(height: 20),

              // Cashier widget
              Cashier(
                changeAmount: _change,
                counterAmount: _counter,
                handleMoneyPress: _incrementCounter,
                onRestartPressed: _restartCount,
              ),
            ],
          ),
        ),
      ),
    ),

    );
  }
}