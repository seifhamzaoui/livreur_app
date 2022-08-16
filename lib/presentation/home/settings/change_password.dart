import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:livreur_app/presentation/constants/colors.dart';
import 'package:livreur_app/presentation/core/custom_icon_button.dart';
import 'package:livreur_app/presentation/core/custom_text_field.dart';
import 'package:livreur_app/presentation/core/primary_widgets.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/swift-background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomIconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Changer Le Mot \nde passe'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'future-friends',
                      fontSize: 24,
                      color: SwiftColors.purple,
                    ),
                  ),
                ),
                const SizedBox(height: 77),
                Text('Le mot de passe actuel*'),
                const SizedBox(height: 17),
                CustomTextField(
                  hintText: 'Le mot de passe actuel',
                  obscureText: true,
                ),
                const SizedBox(height: 35),
                Text('Nouveau mot de passe*'),
                const SizedBox(height: 17),
                CustomTextField(
                  hintText: 'Le Nouveau mot de passe*',
                  obscureText: !showPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
                      color: SwiftColors.purple,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Align(
                  alignment: Alignment.center,
                  child: PrimaryButton(
                    backColor: SwiftColors.purple,
                    frontColor: Colors.white,
                    onPressed: () {},
                    text: 'Valider',
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
