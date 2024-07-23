import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Projects",
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            ListTile(
              onTap: () {},
              title: const Text(
                "I am Rich",
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text(
                "I am Poor",
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text(
                "MiCard",
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text(
                "Dicee",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
