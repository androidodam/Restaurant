import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/components/custom_button.dart';
import 'package:flutter_restaurant_app/common/components/custom_outlined_button.dart';
import 'package:flutter_restaurant_app/common/components/custom_text_filed.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_restaurant_app/main.dart';
import 'package:flutter_restaurant_app/view/auth/forgot_password_screen.dart';
import 'package:flutter_restaurant_app/view/auth/signup_screen.dart';
import 'package:flutter_restaurant_app/view/bnb/bnb.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;
  bool _isChecked = false;
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
                  login.tr,
                  style: theme.testStyle.copyWith(
                    color: tema.primaryColorDark,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                16.o.gapY,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    email.tr,
                    style: theme.testStyle.copyWith(
                      color: tema.primaryColorDark,
                      fontSize: 14,
                      fontFamily: theme.fontPoppins,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                6.o.gapY,
                CustomTextFiled(
                  label: "example@gmail.com",
                  controller: _emailController,
                  borderColor: theme.grey,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                16.o.gapY,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    password.tr,
                    style: theme.testStyle.copyWith(
                      color: tema.primaryColorDark,
                      fontSize: 14,
                      fontFamily: theme.fontPoppins,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                6.o.gapY,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          rememberMe.tr,
                          style: theme.testStyle.copyWith(
                            fontSize: 14,
                            color: tema.primaryColorDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        pushToReplace(ForgotPasswordScreen(), context);
                      },
                      child: Text(
                        "${forgotPassword.tr}?",
                        style: theme.testStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xffE86969),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                16.o.gapY,
                CustomButton(
                  onTap: () {
                    pref.setBool("is_loged_in", true);
                    pushToUntil(Bnb(), context);
                  },
                  status: CustomButtonStatus.ELEVETED,
                  title: login.tr,
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
                  title: loginWGoogle.tr,
                  onTap: () {},
                ),
                10.o.gapY,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${dontAccount.tr}?",
                      style: theme.testStyle.copyWith(
                        color: tema.primaryColorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: theme.fontPoppins,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        pushToReplace(SignupScreen(), context);
                      },
                      child: Text(
                        signup.tr,
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
