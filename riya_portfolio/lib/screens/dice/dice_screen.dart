import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Dicee'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    changeDiceFace();
                  });
                },
                child: Image.asset('images/Dice-$leftDiceNumber.svg.png'),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      changeDiceFace();
                    },
                  );
                },
                child: Image.asset('images/Dice-$rightDiceNumber.svg.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
