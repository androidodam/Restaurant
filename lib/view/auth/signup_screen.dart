import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/components/custom_button.dart';
import 'package:flutter_restaurant_app/common/components/custom_outlined_button.dart';
import 'package:flutter_restaurant_app/common/components/custom_text_filed.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_restaurant_app/main.dart';
import 'package:flutter_restaurant_app/view/auth/login_screen.dart';
import 'package:flutter_restaurant_app/view/bnb/bnb.dart';
import 'package:flutter_svg/svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: tema.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.o),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                16.o.gapY,
                SvgPicture.asset(
                  Assets.icon.logo,
                  width: 100.o,
                  height: 100.o,
                ),
                16.o.gapY,
                Text(
                  createAccount.tr,
                  style: theme.testStyle.copyWith(
                    color: tema.primaryColorDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                16.o.gapY,
                CustomTextFiled(
                  label: enterUser.tr,
                  controller: _nameController,
                  borderColor: theme.grey,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                ),
                16.o.gapY,
                CustomTextFiled(
                  label: enterEmail.tr,
                  controller: _emailController,
                  borderColor: theme.grey,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                16.o.gapY,
                CustomTextFiled(
                  label: enterNumber.tr,
                  controller: _numberController,
                  borderColor: theme.grey,
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                ),
                16.o.gapY,
                CustomTextFiled(
                  label: enterPassword.tr,
                  controller: _passwordController,
                  borderColor: theme.grey,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isObscured,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                      color: tema.primaryColorDark,
                    ),
                  ),
                ),
                16.o.gapY,
                CustomButton(
                  onTap: () {
                    pref.setBool("is_loged_in", true);
                    pushToUntil(Bnb(), context);
                  },
                  status: CustomButtonStatus.ELEVETED,
                  title: signup.tr,
                  textSize: 16.o,
                ),
                30.o.gapY,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1.o,
                        color: theme.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.o),
                      child: Text(
                        continueW.tr,
                        style: theme.testStyle.copyWith(
                          color: tema.primaryColorDark,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: theme.fontPoppins,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1.o,
                        color: theme.grey,
                      ),
                    ),
                  ],
                ),
                30.o.gapY,
                CustomOutlinedButton(
                  status: CustomButtonStatus.ICON,
                  icon: Assets.icon.google,
                  title: signupWGoogle.tr,
                  onTap: () {},
                ),
                10.o.gapY,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      alreadyAccount.tr + "?",
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
    );
  }
}
