// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.backColor,
    required this.frontColor,
    required this.onPressed,
    required this.text,
    this.icon,
  }) : super(key: key);
  final Color backColor;
  final Color frontColor;
  final void Function() onPressed;
  final String text;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        backgroundColor: backColor,
        minimumSize: Size(310, 61.h),
      ),
      onPressed: onPressed,
      child: icon ??
          Text(
            text,
            style: TextStyle(
              color: frontColor,
            ),
          ),
    );
  }
}
