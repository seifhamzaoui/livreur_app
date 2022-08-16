// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodpageViewElement extends StatelessWidget {
  final double time;

  final ImageProvider image;

  final String title;

  final Function onPressed;

  const FoodpageViewElement({
    Key? key,
    required this.time,
    required this.image,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244.w,
      width: 244.w,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(27.w),
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
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
            top: 30.h,
            left: 30.w,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.w),
                  side: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                onPressed();
              },
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 35.sp,
              ),
            ),
          ),
          Positioned(
            bottom: 22.h,
            left: 18.w,
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Livrasion en ${time.floor().toInt()} min',
                      style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
