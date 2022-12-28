

import 'package:e_commerc_2/config/assets_constants.dart';
import 'package:e_commerc_2/model/preference_helper.dart';
import 'package:e_commerc_2/view/screens/home_screen.dart';

import 'package:e_commerc_2/view/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      PreferencesHelper.instance.getIsOpened()==true?Navigator.push(context,
          MaterialPageRoute(builder: (context)=>OnBoardingScreen(),
          )
      ):Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(
              builder: (context)=>HomeScreen()), (route) => false);
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Lottie.asset(AssetConstants.anim3,
    height: MediaQuery.of(context).size.height,
      fit: BoxFit.fill
    ),
    );
  }
}
