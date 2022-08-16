import 'package:flutter/material.dart';
import 'constants/colors.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SwiftColors.purple,
      body: Center(
        child: Container(
          height: 80,
          width: 207,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
