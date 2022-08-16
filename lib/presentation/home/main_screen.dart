import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livreur_app/presentation/home/settings/settings.dart';
import '../constants/colors.dart';
import '../core/Custon_top_navigation_bar.dart';

import '../ordres/orders_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTopNavigationBar(),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bonjour',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          'Hamza',
                          style: TextStyle(
                            color: SwiftColors.purple,
                            fontFamily: 'Montserrat-semi-bold',
                            fontSize: 30.sp,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    SizedBox(width: 10.w),
                  ],
                ),
                SizedBox(height: 50.h),
                Text('Dashboard', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 35.h),
                Row(
                  children: [
                    Expanded(
                      child: InformationsContainer(
                        color: SwiftColors.orange,
                        title: 'Commandes\nComplété',
                        value: '5',
                      ),
                    ),
                    SizedBox(width: 25.w),
                    Expanded(
                      child: InformationsContainer(
                        color: SwiftColors.blue,
                        title: 'Commandes\nen attente',
                        value: '7',
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25.h),
                Container(
                  height: 170.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: ParametereContainer(
                        icon: SvgPicture.asset(
                          'assets/icons/commande.svg',
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: ((context) {
                            return OrdersPage();
                          })));
                        },
                        title: 'Liste des\nCommandes',
                      )),
                      SizedBox(height: 30.h),
                      SizedBox(width: 25.w),
                      Expanded(
                        child: ParametereContainer(
                          icon: SvgPicture.asset(
                            'assets/icons/settings.svg',
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: ((context) {
                              return Settings(
                                isMagasin: true,
                              );
                            })));
                          },
                          title: 'Paramètres',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'عربي',
                      style: TextStyle(
                        color: SwiftColors.purple,
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
          ),
        ),
      ),
    );
  }
}

class ParametereContainer extends StatelessWidget {
  const ParametereContainer({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final Widget icon;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.w),
          color: SwiftColors.purple,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, top: 21.h, bottom: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon,
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontFamily: 'Montserrat-semi-bold',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationsContainer extends StatelessWidget {
  const InformationsContainer({
    Key? key,
    required this.color,
    required this.title,
    required this.value,
  }) : super(key: key);
  final Color color;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        color: color,
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60.sp,
                )),
            Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontFamily: 'Montserrat-semi-bold',
                )),
          ],
        ),
      ),
    );
  }
}
