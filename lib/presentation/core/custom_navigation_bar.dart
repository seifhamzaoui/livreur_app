// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livreur_app/presentation/constants/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.onChangePage,
    required this.indexChoosed,
  }) : super(key: key);
  final void Function(int index) onChangePage;
  final int indexChoosed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.transparent,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: NavigationBarClipper(),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                height: 105,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: BottomNavigationElement(
                        onPressed: () {
                          onChangePage(0);
                        },
                        icon: SvgPicture.asset(
                          indexChoosed == 0
                              ? 'assets/icons/home_fill.svg'
                              : 'assets/icons/home.svg',
                          color: indexChoosed == 0 ? SwiftColors.orange : null,
                        ),
                        title: 'Home',
                        textColor: indexChoosed == 0 ? SwiftColors.orange : null,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: BottomNavigationElement(
                        onPressed: () {
                          onChangePage(1);
                        },
                        icon: SvgPicture.asset(
                          indexChoosed == 1
                              ? 'assets/icons/commande_fill.svg'
                              : 'assets/icons/commande.svg',
                        ),
                        title: 'Commande',
                        textColor: indexChoosed == 1 ? SwiftColors.orange : null,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment(0, 0.5),
                          child: Text(
                            'Panier',
                            style: TextStyle(
                                color: indexChoosed == 2 ? SwiftColors.orange : null,
                                fontSize: 13.sp),
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: BottomNavigationElement(
                        onPressed: () {
                          onChangePage(3);
                        },
                        icon: SvgPicture.asset(
                          indexChoosed == 3
                              ? 'assets/icons/favoris_fill.svg'
                              : 'assets/icons/favoris.svg',
                          color: indexChoosed == 3 ? SwiftColors.orange : null,
                        ),
                        title: 'Favoris',
                        textColor: indexChoosed == 3 ? SwiftColors.orange : null,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: BottomNavigationElement(
                        onPressed: () {
                          onChangePage(4);
                        },
                        icon: SvgPicture.asset(
                          indexChoosed == 4
                              ? 'assets/icons/settings_fill.svg'
                              : 'assets/icons/settings.svg',
                        ),
                        title: 'Parametre',
                        textColor: indexChoosed == 4 ? SwiftColors.orange : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 50,
              left: (MediaQuery.of(context).size.width / 2.5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: indexChoosed == 2 ? SwiftColors.orange : SwiftColors.purple,
                  fixedSize: Size(70, 70),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                ),
                onPressed: () {
                  onChangePage(2);
                },
                child: SvgPicture.asset(
                  'assets/icons/panier.svg',
                ),
              ))
        ],
      ),
    );
  }
}

class BottomNavigationElement extends StatelessWidget {
  final Widget icon;

  final String title;
  final Color? textColor;
  final void Function() onPressed;

  const BottomNavigationElement({
    Key? key,
    required this.icon,
    required this.title,
    this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Spacer(),
          icon,
          SizedBox(height: 5.h),
          Text(
            title,
            style: TextStyle(fontSize: 13.sp, color: textColor),
          ),
          Spacer(),
          if (textColor == SwiftColors.orange) Image.asset('assets/icons/triangle.png'),
        ],
      ),
    );
  }
}

class NavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // path.quadraticBezierTo(
    //   size.width / 2 - 10,
    //   size.height / 2,
    //   size.width / 2,
    //   size.height / 3 * 2,
    // );
    double w1 = 70;
    double w2 = 35;
    double h1 = 15;
    double h2 = 1.6;
    path.lineTo(size.width / 2 - w1, 0);
    path.arcToPoint(Offset(size.width / 2 - w2, size.height / 2 - h1),
        radius: Radius.circular(size.height / 2), clockwise: true);
    path.arcToPoint(Offset(size.width / 2, size.height / h2),
        radius: Radius.circular(size.height / 2), clockwise: false);
    /////
    path.arcToPoint(Offset(size.width / 2 + w2, size.height / 2 - h1),
        radius: Radius.circular(size.height / 2), clockwise: false);
    path.arcToPoint(Offset(size.width / 2 + w1, 0),
        radius: Radius.circular(size.height / 2), clockwise: true);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
