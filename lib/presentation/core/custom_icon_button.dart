import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.backColor,
  }) : super(key: key);
  final Widget icon;
  final void Function() onPressed;
  Color? backColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 52.w,
        width: 52.w,
        padding: EdgeInsets.only(),
        decoration: BoxDecoration(
          color: backColor ?? Colors.white,
          borderRadius: BorderRadius.circular(9.h),
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(backColor ?? Colors.white),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 0, vertical: 15.h)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Center(child: icon),
    );
  }
}
