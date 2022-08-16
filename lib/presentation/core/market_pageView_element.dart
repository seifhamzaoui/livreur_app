// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livreur_app/presentation/constants/colors.dart';

class MarketPageViewElement extends StatelessWidget {
  final double review;

  final ImageProvider image;

  final String name;

  final String type;
  final Function onPressed;
  final double deliveryPrice;

  const MarketPageViewElement({
    Key? key,
    required this.review,
    required this.image,
    required this.name,
    required this.type,
    required this.onPressed,
    required this.deliveryPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 244,
        width: 244,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(27),
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 30,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                    side: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: null,
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    SvgPicture.asset(
                      'assets/icons/livraison_big.svg',
                      color: Colors.black,
                      width: 25.w,
                      height: 25.h,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      '$deliveryPrice DA',
                      style: TextStyle(color: SwiftColors.orange),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
            ),
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0),
                      Colors.black,
                    ],
                  ),
                ),
              );
            }),
            Positioned(
              bottom: 22,
              left: 18,
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(height: 5),
                      Text(
                        type,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(width: 60),
                  Image.asset('assets/icons/yellow_star.png'),
                  SizedBox(width: 10),
                  Text('$review', style: TextStyle(fontSize: 16, color: Colors.white))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
