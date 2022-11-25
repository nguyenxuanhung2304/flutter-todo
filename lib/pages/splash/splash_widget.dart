import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/welcome_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: Image.asset('images/logo.png'),
      nextScreen: const WelcomePage(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.black,
    );
  }
}
