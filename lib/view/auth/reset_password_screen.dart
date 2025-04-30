import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/components/custom_button.dart';
import 'package:flutter_restaurant_app/common/components/custom_text_filed.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_restaurant_app/view/auth/changed_password_screen.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _resetPasswordController = TextEditingController();
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
                  resetPassword.tr,
                  style: theme.testStyle.copyWith(
                    color: tema.primaryColorDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                18.o.gapY,
                Text(
                  resetText.tr,
                  style: theme.testStyle.copyWith(
                    color: tema.primaryColorDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                34.o.gapY,
                CustomTextFiled(
                    label: newPassword.tr,
                    controller: _passwordController,
                    borderColor: theme.grey,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: false),
                20.o.gapY,
                CustomTextFiled(
                    label: repeatPassword.tr,
                    controller: _resetPasswordController,
                    borderColor: theme.grey,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: false),
                24.o.gapY,
                CustomButton(
                  onTap: () {
                    pushToReplace(ChangedPasswordScreen(), context);
                  },
                  title: resetPassword.tr,
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
