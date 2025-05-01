import 'package:flutter/material.dart';
import 'dart:math';

class MiniGame extends StatefulWidget {
  const MiniGame({super.key});

  @override
  State<MiniGame> createState() => _MiniGameState();
}

class _MiniGameState extends State<MiniGame> {
  int _score = 0;
  int _totalAttempts = 0;
  int _targetNumber = Random().nextInt(5);

  void _handleGuess(int guess) {
    setState(() {
      _totalAttempts++;
    });

    if (guess == _targetNumber) {
      setState(() {
        _score++;
        _targetNumber = Random().nextInt(5);
      });
      _showResultDialog("🎉 Correct!", true);
    } else {
      _showResultDialog("😅 Wrong! Try again!", false);
    }
  }

  double get _accuracy {
    if (_totalAttempts == 0) return 0.0;
    return (_score / _totalAttempts) * 100;
  }

  void _showResultDialog(String message, bool isSuccess) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(message, textAlign: TextAlign.center),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Score: $_score"),
            Text("Attempts: $_totalAttempts"),
            Text("Accuracy: ${_accuracy.toStringAsFixed(2)}%"),
          ],
        ),
        backgroundColor: isSuccess ? Colors.green.shade100 : Colors.red.shade100,
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 15,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "🎯 Guess the Number!",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "I'm thinking of a number between 0 and 4.\nCan you guess it?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(5, (index) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        onPressed: () => _handleGuess(index),
                        child: Text("$index"),
                      );
                    }),
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
