import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/components/custom_button.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_restaurant_app/view/auth/login_screen.dart';
import 'package:flutter_svg/svg.dart';

class ChangedPasswordScreen extends StatefulWidget {
  const ChangedPasswordScreen({super.key});

  @override
  State<ChangedPasswordScreen> createState() => _ChangedPasswordScreenState();
}

class _ChangedPasswordScreenState extends State<ChangedPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: tema.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.o),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                120.o.gapY,
                SvgPicture.asset(
                  Assets.icon.logo,
                  width: 100.o,
                  height: 100.o,
                ),
                26.o.gapY,
                Text(
                  changedPassword.tr,
                  style: theme.testStyle.copyWith(
                    color: tema.primaryColorDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                18.o.gapY,
                Text(
                  changedText.tr,
                  style: theme.testStyle.copyWith(
                    color: tema.primaryColorDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                34.o.gapY,
                CustomButton(
                  onTap: () {
                    pushToReplace(LoginScreen(), context);
                  },
                  title: loginBack.tr,
                  status: CustomButtonStatus.ELEVETED,
                  textSize: 16.o,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
