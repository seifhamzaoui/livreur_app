// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:livreur_app/presentation/constants/colors.dart';
import 'package:livreur_app/presentation/core/custom_icon_button.dart';
import 'package:livreur_app/presentation/home/settings/change_password.dart';
import 'package:livreur_app/presentation/home/settings/change_phone_number.dart';
import 'package:livreur_app/presentation/home/settings/change_username.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key, this.isMagasin = false}) : super(key: key);
  final bool isMagasin;
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool showUserFields = false;
  @override
  Widget build(BuildContext context) {
    ScaffoldState? scaffold;
    if (!widget.isMagasin) scaffold = Scaffold.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(icon: Icon(Icons.arrow_back_ios_new), onPressed: () {}),
                  Expanded(child: Image.asset('assets/images/logo_small.png')),
                  CustomIconButton(
                    icon: SvgPicture.asset('assets/icons/notification.svg'),
                    onPressed: () {
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (context) => Notifications()));
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleProfilePhoto(
                    onPressed: () {},
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hamza',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                          color: SwiftColors.purple,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Bendahmane',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w100,
                          color: SwiftColors.hintGreyColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 54),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: SwiftColors.orange.withOpacity(0.14),
                    child: Icon(
                      Icons.person_rounded,
                      color: SwiftColors.orange,
                      size: 28.sp,
                    ),
                  ),
                  Text(
                    'Paramètres du \nProfil',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  Transform.rotate(
                    angle: showUserFields ? pi / 2 : 0,
                    child: CustomIconButton(
                      backColor: Color(0xffF4F0F6),
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: SwiftColors.hintGreyColor,
                      ),
                      onPressed: () {
                        setState(() {
                          showUserFields = !showUserFields;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              if (showUserFields) ...[
                SettingsPageItem(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                      return ChangeUsername();
                    })));
                  },
                  title: 'Nom d\'Utilisateur',
                  value: 'Hamza_b',
                ),
                SizedBox(height: 40.h),
                SettingsPageItem(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                      return ChangePhoneNumber();
                    })));
                  },
                  title: 'Numéro du Téléphone',
                  value: '0665******',
                ),
                SizedBox(height: 40.h),
                SettingsPageItem(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                      return ChangePassword();
                    })));
                  },
                  title: 'Mot de passe',
                  value: '***************',
                )
              ],
              SizedBox(height: 30.h),
              const SizedBox(height: 120)
            ],
          ),
        ),
      )),
    );
  }
}

class SettingsPageItem extends StatelessWidget {
  const SettingsPageItem({
    Key? key,
    required this.title,
    required this.value,
    required this.onPressed,
    this.textColor,
  }) : super(key: key);
  final String title;
  final String value;
  final Function onPressed;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w100,
                  color: textColor ?? SwiftColors.orange,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              onPressed();
            },
            child: Container(
              height: 35.w,
              width: 35.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Color(0xffF4F0F6),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: SwiftColors.hintGreyColor,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleProfilePhoto extends StatelessWidget {
  const CircleProfilePhoto({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114.w,
      width: 114.w,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffF4F0F6),
            radius: 57.w,
            child: Icon(
              Icons.person_rounded,
              size: 110.sp,
              color: Color(0xff707070),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                onPressed();
              },
              child: SvgPicture.asset('assets/icons/add_photo.svg'),
            ),
          )
        ],
      ),
    );
  }
}
