import 'package:flutter/material.dart';

class IAmRichScreen extends StatelessWidget {
  const IAmRichScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'I am Rich',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Image(
          image: AssetImage(
            'images/dimond.png',
          ),
        ),
      ),
    );
  }
}
