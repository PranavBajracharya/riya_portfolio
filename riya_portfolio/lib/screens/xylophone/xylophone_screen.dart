import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

class XylophoneScreen extends StatefulWidget {
  const XylophoneScreen({super.key});

  @override
  State<XylophoneScreen> createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  void PlaySound(int soundNumber) {
    final player = AudioPlayer();
    player.play(
      AssetSource('note$soundNumber.wav'),
    );
  }

  Expanded Key({required Color color, required int soundNumber}) {
    return Expanded(
      child: Container(
        color: color,
        child: ElevatedButton(
          onPressed: () {
            PlaySound(soundNumber);
          },
          child: null,
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
            Key(color: Colors.red, soundNumber: 1),
            Key(color: Colors.orange, soundNumber: 2),
            Key(color: Colors.yellow, soundNumber: 3),
            Key(color: Colors.lightGreen, soundNumber: 4),
            Key(color: Colors.green, soundNumber: 5),
            Key(color: Colors.blue, soundNumber: 6),
            Key(color: Colors.purple, soundNumber: 7),
            
          ],
        ),
      ),
    );
  }
}
