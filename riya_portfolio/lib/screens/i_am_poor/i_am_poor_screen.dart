import 'package:flutter/material.dart';

class IAmPoorScreen extends StatelessWidget {
  const IAmPoorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 217, 153, 228),
        centerTitle: true,
        title: const Text(
          'I Am Poor',
        ),
      ),
      body: const Column(
        children: [
          Center(
            child: Image(
              image: AssetImage('images/images.jpeg'),
            ),
          ),
          Row(
            children: [
              Text('I am poor.'),
              Text('I am very poor.'),
            ],
          )
        ],
      ),
    );
  }
}
