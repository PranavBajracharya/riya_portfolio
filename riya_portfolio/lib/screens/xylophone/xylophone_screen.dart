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
    String? text,
    Color? textColor,
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
        child: Text(
          text ?? 'No Value',
          style: TextStyle(
            fontSize: 30.0,
            color: textColor,
          ),
        ),
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
              // text: 'Sa',
              textColor: Colors.black,
            ),
            key(
              color: Colors.orange,
              soundNumber: 2,
              text: 'Re',
              textColor: Colors.black,
            ),
            key(
              color: Colors.yellow,
              soundNumber: 3,
              text: 'Ga',
            ),
            key(
              color: Colors.lightGreen,
              soundNumber: 4,
              text: 'Ma',
            ),
            key(
              color: Colors.green,
              soundNumber: 5,
              text: 'Pa',
              textColor: Colors.white,
            ),
            key(
              color: Colors.blue,
              soundNumber: 6,
              text: 'Dha',
              textColor: Colors.white,
            ),
            key(
              color: Colors.purple,
              soundNumber: 7,
              text: 'Ne',
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
