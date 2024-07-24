import 'package:flutter/material.dart';
import 'package:riya_portfolio/screens/i_am_poor/i_am_poor_screen.dart';
import 'package:riya_portfolio/screens/i_am_rich/i_am_rich_screen.dart';

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
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const IAmRichScreen();
                    },
                  ),
                );
              },
              title: const Text(
                "I am Rich",
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const IAmPoorScreen();
                    },
                  ),
                );
              },
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
