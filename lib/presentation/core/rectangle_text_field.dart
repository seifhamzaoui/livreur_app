import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';

class RectangleTextField extends StatelessWidget {
  const RectangleTextField({
    Key? key,
    this.onChanged,
    this.validator,
    this.focusNode,
  }) : super(key: key);
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: TextFormField(
        focusNode: focusNode,
        validator: validator,
        onChanged: onChanged,
        cursorColor: SwiftColors.purple,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          filled: true,
          fillColor: Color(0xFF4D0060).withOpacity(0.06),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.w),
              borderSide: BorderSide(color: SwiftColors.purple, width: 2.w)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
