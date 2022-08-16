import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../core/primary_widgets.dart';
import '../home/main_screen.dart';

class GpsRequired extends StatelessWidget {
  const GpsRequired({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/swift-background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'ACTIVEZ VOTRE GPS \nS\'IL VOUS PLAIT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'future-friends', color: SwiftColors.purple, fontSize: 24),
                  ),
                  Align(alignment: Alignment.center, child: Image.asset('assets/images/gps.png')),
                  PrimaryButton(
                    backColor: SwiftColors.purple,
                    frontColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (c) => MainScreen()));
                    },
                    text: 'Continuer',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
