import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:riya_portfolio/screens/flash_chat/screens/chat_screen.dart';
import 'package:riya_portfolio/screens/flash_chat/screens/login_screen.dart';
import 'package:riya_portfolio/screens/flash_chat/screens/registration_screen.dart';
import 'package:riya_portfolio/screens/flash_chat/screens/welcome_screen.dart';
import 'package:riya_portfolio/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Riya Portfolio",
      // home: SplashScreen(),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        // 'login_screen': (context) => LoginScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
    );
  }
}
