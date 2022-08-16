import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors.dart';

class MarketGridElement extends StatelessWidget {
  const MarketGridElement({
    Key? key,
    required this.iconPath,
    this.onPressed,
    required this.title,
  }) : super(key: key);
  final String iconPath;
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed ?? () {},
          child: Container(
            height: 130.w,
            width: 130.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFC7700),
                  Color(0xffEA6F00).withOpacity(1),
                ],
              ),
              color: SwiftColors.orange,
              borderRadius: BorderRadius.circular(65.w),
            ),
            child: Center(
              child: SvgPicture.asset(iconPath),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
