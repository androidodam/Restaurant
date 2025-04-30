import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_restaurant_app/common/components/custom_button.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/keys.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_restaurant_app/main.dart';
import 'package:flutter_restaurant_app/view_model/theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isTheme = false;
  @override
  void initState() {
    isTheme = pref.getString("theme") == "light" ? true : false;
    super.initState();
  }

  void showModal(BuildContext context, ThemeData tema) {
    final key = pref.getString("language");
    int focus = key == "uz"
        ? 0
        : key == "ru"
            ? 1
            : 2;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(16.o),
              width: 1.sw(context),
              height: 240.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: tema.scaffoldBackgroundColor,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          focus = index;
                          if (index == 0) {
                            pref.setString("language", "uz");
                            _setLanguage("uz");
                          }
                          if (index == 1) {
                            pref.setString("language", "ru");
                            _setLanguage("ru");
                          }
                          if (index == 2) {
                            pref.setString("language", "en");
                            _setLanguage("en");
                          }
                          pop(context);
                        });
                      },
                      child: _buildLanguage(
                        context,
                        [uz.tr, ru.tr, en.tr][index],
                        [
                          Assets.icon.uzb,
                          Assets.icon.rus,
                          Assets.icon.us,
                        ][index],
                        focus == index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => 16.o.gapY,
                  itemCount: 3),
            );
          },
        );
      },
    );
  }

  Widget _buildLanguage(
      BuildContext context, String lang, String icon, bool isFocus) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.o),
      width: 1.sw(context),
      height: 50.o,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(15.o),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.o),
            child: SvgPicture.asset(
              icon,
              width: 24.o,
              height: 24.o,
            ),
          ),
          10.o.gapx,
          Expanded(
            child: Text(
              lang,
              style: theme.testStyle.copyWith(
                fontSize: 16.o,
                color: theme.white,
              ),
            ),
          ),
          isFocus
              ? Icon(
                  Icons.radio_button_checked,
                  color: Colors.blue,
                )
              : Icon(
                  Icons.radio_button_off,
                  color: Colors.blue,
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: tema.scaffoldBackgroundColor,
        body: Container(
          width: 1.sw(context),
          height: 1.sh(context),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                10.o.gapY,
                Text(
                  profile.tr,
                  style: theme.testStyle.copyWith(
                    color: tema.primaryColorDark,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                40.o.gapY,
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.o),
                    color: Color(0xffC1E0CF),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: Container(
                          width: 90.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.o),
                          ),
                          child: Image.asset(Assets.image.person),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SvgPicture.asset(
                          Assets.icon.edit,
                        ),
                      ),
                    ],
                  ),
                ),
                24.o.gapY,
                Container(
                  width: 1.sw(context),
                  height: 300.h,
                  margin: EdgeInsets.symmetric(horizontal: 20.o),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.o),
                    color: tema.focusColor,
                    boxShadow: [
                      BoxShadow(
                        color: theme.grey.withValues(alpha: 0.3),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.o),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          personalInfo.tr,
                          style: theme.testStyle.copyWith(
                            color: tema.primaryColorDark,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        20.o.gapY,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              yourName.tr,
                              style: theme.testStyle.copyWith(
                                color: theme.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Ibrohimjon Nosiraliyev",
                              style: theme.testStyle.copyWith(
                                color: theme.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        20.o.gapY,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              occupation.tr,
                              style: theme.testStyle.copyWith(
                                color: theme.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Student",
                              style: theme.testStyle.copyWith(
                                color: theme.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        20.o.gapY,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              address.tr,
                              style: theme.testStyle.copyWith(
                                color: theme.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Tashkent, Uzbekistan",
                              style: theme.testStyle.copyWith(
                                color: theme.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        20.o.gapY,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              profileTheme.tr,
                              style: theme.testStyle.copyWith(
                                color: theme.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Switch(
                              activeColor: theme.green,
                              value: isTheme,
                              onChanged: (value) {
                                setState(() {
                                  isTheme = !isTheme;
                                  setState(() {
                                    themeNotifier.changeTheme(isTheme);
                                  });
                                });
                              },
                            ),
                          ],
                        ),
                        20.o.gapY,
                        InkWell(
                          onTap: () {
                            showModal(context, tema);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                language.tr,
                                style: theme.testStyle.copyWith(
                                  color: theme.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SvgPicture.asset(
                                Assets.icon.globe,
                                colorFilter: ColorFilter.mode(
                                    tema.primaryColorDark, BlendMode.srcIn),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                20.o.gapY,
                Container(
                  width: 1.sw(context),
                  height: 160.h,
                  margin: EdgeInsets.symmetric(horizontal: 20.o),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.o),
                    color: tema.focusColor,
                    boxShadow: [
                      BoxShadow(
                        color: theme.grey.withValues(alpha: 0.3),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.o),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contactInfo.tr,
                          style: theme.testStyle.copyWith(
                            color: tema.primaryColorDark,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        20.o.gapY,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              phoneNumber.tr,
                              style: theme.testStyle.copyWith(
                                color: theme.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "+998 977777777",
                              style: theme.testStyle.copyWith(
                                color: theme.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        20.o.gapY,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              emailP.tr,
                              style: theme.testStyle.copyWith(
                                color: theme.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "example@gmail.com",
                              style: theme.testStyle.copyWith(
                                color: theme.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: CustomButton(
                    onTap: () {},
                    title: edit.tr,
                    status: CustomButtonStatus.ELEVETED,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _setLanguage(String language) async {
    lang = language;
    changeLocale(context, language);
    pref.setString("language", language);
  }
}
