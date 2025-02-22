import 'package:flutter/material.dart';
import 'package:riya_portfolio/screens/bitcoin_ticker/price_screen.dart';
import 'package:riya_portfolio/screens/bmi_calculator/screens/bmi_calculator_screen.dart';
import 'package:riya_portfolio/screens/clima/screens/loading_screen.dart';
import 'package:riya_portfolio/screens/fake_store/fake_store_screen.dart';
import 'package:riya_portfolio/screens/flash_chat/screens/welcome_screen.dart';
import 'package:riya_portfolio/screens/magic_8_ball/magic_ball_screen.dart';
import 'package:riya_portfolio/screens/dice/dice_screen.dart';
import 'package:riya_portfolio/screens/i_am_poor/i_am_poor_screen.dart';
import 'package:riya_portfolio/screens/i_am_rich/i_am_rich_screen.dart';
import 'package:riya_portfolio/screens/mi_card/mi_card_screen.dart';
import 'package:riya_portfolio/screens/quizzler/quizzler_screen.dart';
import 'package:riya_portfolio/screens/xylophone/xylophone_screen.dart';

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MiCardScreen();
                    },
                  ),
                );
              },
              title: const Text(
                "MiCard",
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DiceScreen();
                    },
                  ),
                );
              },
              title: const Text(
                "Dicee",
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MagicBallScreen();
                    },
                  ),
                );
              },
              title: const Text(
                "Magic 8 Ball",
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const XylophoneScreen();
                    },
                  ),
                );
              },
              title: const Text(
                'Xylophone',
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const QuizzlerScreen();
                    },
                  ),
                );
              },
              title: const Text('Quizzler'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const BmiCalculatorScreen();
                    },
                  ),
                );
              },
              title: const Text('BMI Calculator'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoadingScreen();
                    },
                  ),
                );
              },
              title: const Text('Clima'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FakeStoreScreen();
                    },
                  ),
                );
              },
              title: const Text('Fake Store'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PriceScreen();
                    },
                  ),
                );
              },
              title: Text('BitCoin Ticker'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                      
                    },
                  ),
                );
              },
              title: Text('Flash Chat'),
            )
          ],
        ),
      ),
    );
  }
}
