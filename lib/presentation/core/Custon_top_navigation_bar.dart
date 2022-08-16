import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_icon_button.dart';

class CustomTopNavigationBar extends StatelessWidget {
  const CustomTopNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: SvgPicture.asset('assets/icons/logout.svg'),
          onPressed: () {},
        ),
        Expanded(child: Image.asset('assets/images/logo_small.png')),
        CustomIconButton(
          icon: SvgPicture.asset('assets/icons/notification.svg'),
          onPressed: () {},
        ),
      ],
    );
  }
}
