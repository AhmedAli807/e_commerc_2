import 'package:e_commerc_2/view/screens/home_screen.dart';
import 'package:e_commerc_2/view/screens/onboarding_screen.dart';
import 'package:e_commerc_2/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home:HomeScreen()
    );
  }
}


