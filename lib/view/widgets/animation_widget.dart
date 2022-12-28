import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationWidgets extends StatelessWidget {
final String path;
AnimationWidgets(this.path);
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(path);
  }


}
