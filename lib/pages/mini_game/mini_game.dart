import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MiniGame extends StatefulWidget {
  const MiniGame({super.key});

  @override
  State<MiniGame> createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame> {
  int _score = 0;
  int _totalAttempts = 0;
  int _targetNumber = Random().nextInt(5);
  final _player = AudioPlayer();

  void _playSound(bool correct) {
    final path = correct ? 'assets/success.mp3' : 'assets/fail.mp3';
    _player.play(AssetSource(path));
  }

  void _handleGuess(int guess) {
    setState(() => _totalAttempts++);

    if (guess == _targetNumber) {
      _playSound(true);
      setState(() {
        _score++;
        _targetNumber = Random().nextInt(5);
      });
      _showResultDialog("🎉 Correct!", true);
    } else {
      _playSound(false);
      _showResultDialog("❌ Wrong!", false);
    }
  }

  double get _accuracy => _totalAttempts == 0 ? 0.0 : (_score / _totalAttempts) * 100;

  void _showResultDialog(String message, bool isSuccess) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        title: Center(
          child: AnimatedTextKit(
            repeatForever: false,
            totalRepeatCount: 1,
            animatedTexts: [
              ScaleAnimatedText(message, textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Score: $_score"),
            Text("Attempts: $_totalAttempts"),
            Text("Accuracy: ${_accuracy.toStringAsFixed(2)}%"),
          ],
        ),
        backgroundColor: isSuccess ? Colors.green.shade200 : Colors.red.shade200,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Play More!"),
          )
        ],
      ),
    );
  }

  Widget _buildGuessButton(int number) {
    return GestureDetector(
      onTapDown: (_) => setState(() {}),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        onPressed: () => _handleGuess(number),
        child: Text("$number", style: const TextStyle(fontSize: 20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 20,
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("🔢 Guess the Number!", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text(
                    "I'm thinking of a number between 0 & 4.\nCan you guess it?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 14,
                    runSpacing: 12,
                    children: List.generate(5, (index) => _buildGuessButton(index)),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  Text("Score: $_score", style: Theme.of(context).textTheme.titleMedium),
                  Text("Attempts: $_totalAttempts", style: Theme.of(context).textTheme.titleMedium),
                  Text("Accuracy: ${_accuracy.toStringAsFixed(2)}%", style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
