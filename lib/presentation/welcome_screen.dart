// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livreur_app/presentation/constants/colors.dart';
import 'package:livreur_app/presentation/core/custom_text_field.dart';
import 'package:livreur_app/presentation/core/primary_widgets.dart';
import 'package:livreur_app/presentation/error/gps_required.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  bool showLogin = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
      ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (showLogin) {
          setState(() {
            showLogin = false;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: SwiftColors.purple,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                    child: Transform.scale(
                  scale: 1.6,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: MediaQuery.of(context).size.width * 1.5,
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: WaterRipplePainter(
                            _controller.value,
                            count: 6,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                )),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.45,
                          child: Transform.translate(
                            offset: Offset(0, -20),
                            child: Transform.scale(
                              scale: 0.9,
                              child: Container(
                                child: Image.asset(
                                  'assets/images/eleptic_preview_2.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 47.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CONNECTEZ-VOUS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontFamily: 'future-friends',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Text(
                              'Nom d\'utilisateur*',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'montserrat-semi-bold',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 18.h),
                            CustomTextField(
                              hintText: 'Insérez votre nom d\'utilisateur',
                              fillColor: Colors.white,
                              icon: SvgPicture.asset('assets/icons/person.svg'),
                            ),
                            SizedBox(
                              height: 31.h,
                            ),
                            Text(
                              'Mot de passe*',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'montserrat-semi-bold',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 18.h),
                            CustomTextField(
                              hintText: 'Insérez votre mot de passe',
                              fillColor: Colors.white,
                              icon: SvgPicture.asset('assets/icons/lock.svg'),
                              validator: (val) {
                                return val;
                              },
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            PrimaryButton(
                              backColor: SwiftColors.orange,
                              frontColor: Colors.white,
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (c) => GpsRequired()));
                              },
                              text: 'connectez-vous',
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'عربي',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset('assets/icons/earth.png'),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WaterRipplePainter extends CustomPainter {
  final double progress;
  final int count;
  final Color color;

  Paint _paint = Paint()..style = PaintingStyle.stroke;

  WaterRipplePainter(this.progress, {this.count = 3, this.color = const Color(0xFF0080ff)});

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width / 2, size.height / 2);

    for (int i = count; i >= 0; i--) {
      final double opacity = (1.0 - ((i + progress) / (count + 1)));
      final Color _color = color.withOpacity(opacity);
      _paint..color = _color;
      _paint.strokeWidth = 3;

      double _radius = radius * ((i + progress) / (count + 1));

      canvas.drawCircle(Offset(size.width / 2, size.height / 2), _radius, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
