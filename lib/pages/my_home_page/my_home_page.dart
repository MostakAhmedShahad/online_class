import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      _showResultDialog("Correct! 🎉");
    } else {
      _showResultDialog("Wrong! Try again 😅");
    }
  }

  double get _accuracy {
    if (_totalAttempts == 0) return 0.0;
    return (_score / _totalAttempts) * 100;
  }

  void _showResultDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        content: Text("Score: $_score\nAttempts: $_totalAttempts\nAccuracy: ${_accuracy.toStringAsFixed(2)}%"),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Guess the Number!"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "I'm thinking of a number between 0 and 4.",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),
              Text(
                "Can you guess it?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 12,
                children: List.generate(5, (index) {
                  return ElevatedButton(
                    onPressed: () => _handleGuess(index),
                    child: Text("$index"),
                  );
                }),
              ),
              const SizedBox(height: 50),
              Text(
                "Score: $_score",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "Attempts: $_totalAttempts",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                "Accuracy: ${_accuracy.toStringAsFixed(2)}%",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
