import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

class XylophoneScreen extends StatefulWidget {
  const XylophoneScreen({super.key});

  @override
  State<XylophoneScreen> createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  void playSound(
    int soundNumber,
  ) {
    final player = AudioPlayer();
    player.play(
      AssetSource('note$soundNumber.wav'),
    );
  }

  Expanded key({
    required Color color,
    required int soundNumber,
  }) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          shape: const WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            key(
              color: Colors.red,
              soundNumber: 1,
            ),
            key(
              color: Colors.orange,
              soundNumber: 2,
            ),
            key(
              color: Colors.yellow,
              soundNumber: 3,
            ),
            key(
              color: Colors.lightGreen,
              soundNumber: 4,
            ),
            key(
              color: Colors.green,
              soundNumber: 5,
            ),
            key(
              color: Colors.blue,
              soundNumber: 6,
            ),
            key(
              color: Colors.purple,
              soundNumber: 7,
            ),
          ],
        ),
      ),
    );
  }
}
