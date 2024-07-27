import 'dart:math';

import 'package:flutter/material.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({super.key});

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  int magicBallNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: const Text(
          'Ask Me Anything',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(
              () {
                magicBallNumber = Random().nextInt(4) + 1;
              },
            );
          },
          child: Image(
            image: AssetImage('images/magicball$magicBallNumber.jpeg'),
          ),
        ),
      ),
    );
  }
}
