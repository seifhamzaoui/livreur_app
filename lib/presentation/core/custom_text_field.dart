// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livreur_app/presentation/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.obscureText,
    this.onChanged,
    this.validator,
    this.icon,
    this.suffixIcon,
    this.fillColor,
  }) : super(key: key);
  final String hintText;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? icon;
  final Widget? suffixIcon;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 24.h, bottom: 24.h, right: 10.w),
            filled: true,
            errorStyle: TextStyle(
              color: Color(0xff96436D),
              fontSize: 18.sp,
              height: 2,
              background: Paint()
                ..color = Color(0xffF8D7DA)
                ..style = PaintingStyle.fill
                ..strokeWidth = 10
                ..strokeWidth = 2,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: icon,
            ),
            suffixIcon: suffixIcon,
            fillColor: fillColor ?? Color(0xFF4D0060).withOpacity(0.06),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            hintStyle: TextStyle(
                color: SwiftColors.hintGreyColor, fontSize: 13.sp, overflow: TextOverflow.ellipsis),
          ),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}

class ErrorTextPaint extends Paint {
  @override
  void paint(Canvas canvas, Size size) {
    this.style = PaintingStyle.fill;
    this.color = Colors.red;
    canvas.drawRect(Rect.largest, this);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
