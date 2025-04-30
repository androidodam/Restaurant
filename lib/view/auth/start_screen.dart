import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/components/custom_button.dart';
import 'package:flutter_restaurant_app/common/components/custom_outlined_button.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_restaurant_app/view/auth/login_screen.dart';
import 'package:flutter_restaurant_app/view/auth/signup_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: tema.scaffoldBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.o),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.icon.logo),
              27.o.gapY,
              SvgPicture.asset(
                Assets.icon.ARestro,
                colorFilter: ColorFilter.mode(
                  tema.primaryColorDark,
                  BlendMode.srcIn,
                ),
              ),
              130.o.gapY,
              CustomButton(
                onTap: () {
                  pushToReplace(LoginScreen(), context);
                },
                status: CustomButtonStatus.ELEVETED,
                title: login.tr,
                textSize: 16.o,
              ),
              16.o.gapY,
              CustomOutlinedButton(
                status: CustomButtonStatus.ELEVETED,
                title: signup.tr,
                onTap: () {
                  pushToReplace(SignupScreen(), context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
