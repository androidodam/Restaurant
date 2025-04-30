import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/components/custom_button.dart';
import 'package:flutter_restaurant_app/common/components/custom_text_filed.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_restaurant_app/view/auth/login_screen.dart';
import 'package:flutter_restaurant_app/view/auth/reset_password_screen.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();
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
                  forgotPassword.tr,
                  style: theme.testStyle.copyWith(
                    color: tema.primaryColorDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                18.o.gapY,
                Text(
                  textAlign: TextAlign.center,
                  forgotText.tr,
                  style: theme.testStyle.copyWith(
                    color: tema.primaryColorDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                34.o.gapY,
                CustomTextFiled(
                    label: enterEmail.tr,
                    controller: _emailController,
                    borderColor: theme.grey,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false),
                24.o.gapY,
                CustomButton(
                  onTap: () {
                    pushToReplace(ResetPasswordScreen(), context);
                  },
                  title: sendCode.tr,
                  status: CustomButtonStatus.ELEVETED,
                  textSize: 16.o,
                ),
                26.o.gapY,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${rememberPassword.tr}?",
                      style: theme.testStyle.copyWith(
                        color: tema.primaryColorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: theme.fontPoppins,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        pushToReplace(LoginScreen(), context);
                      },
                      child: Text(
                        login.tr,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: theme.fontPoppins,
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
