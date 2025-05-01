import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/components/custom_button.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_restaurant_app/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int count = 0;
  @override
  void initState() {
    count = pref.getInt("food") ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: tema.scaffoldBackgroundColor,
        body: Stack(
          children: [
            Container(
              width: 1.sw(context),
              height: 1.sh(context),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.sw(context),
                      height: 350.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.image.burger_detail),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pop(context);
                              },
                              child: Container(
                                width: 36.w,
                                height: 36.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.o),
                                  color: theme.grey,
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: theme.black,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              width: 36.w,
                              height: 36.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.o),
                                color: theme.grey,
                              ),
                              child: SvgPicture.asset(
                                Assets.icon.heart,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    20.o.gapY,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              detailTitle.tr,
                              style: theme.testStyle.copyWith(
                                color: tema.primaryColorDark,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          14.o.gapY,
                          Row(
                            children: [
                              SvgPicture.asset(Assets.icon.star05),
                              10.o.gapx,
                              Text(
                                "4.8 ${rating.tr}",
                                style: theme.testStyle.copyWith(
                                  color: theme.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              30.o.gapx,
                              SvgPicture.asset(Assets.icon.bag),
                              10.o.gapx,
                              Text(
                                "2000+ ${orderCount.tr}",
                                style: theme.testStyle.copyWith(
                                  color: theme.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          20.o.gapY,
                          Text(
                            detailDes.tr,
                            style: theme.testStyle.copyWith(
                              color: tema.primaryColorDark,
                              fontSize: 14,
                              overflow: TextOverflow.visible,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            (pref.getInt("food") ?? 0) != 0
                ? Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      color: theme.tr,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: theme.tr,
                              child: CustomButton(
                                title: gotoCart.tr,
                                onTap: () {
                                  //Cart screen ga o'tishi kerak
                                },
                                status: CustomButtonStatus.ELEVETED,
                              ),
                            ),
                          ),
                          20.o.gapx,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff142737),
                            ),
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (count >= 1) {
                                      setState(() {
                                        count--;
                                        if (count == 0) {
                                          pref.setInt("food", 0);
                                        }
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: theme.grey,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: theme.green,
                                    ),
                                  ),
                                ),
                                10.o.gapx,
                                Text(
                                  "${count}",
                                  style: theme.testStyle.copyWith(
                                    color: theme.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                10.o.gapx,
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      count++;
                                      pref.setInt("food", count);
                                    });
                                  },
                                  child: Container(
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: theme.green,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: theme.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Container(
                      color: theme.tr,
                      child: CustomButton(
                        title: addCart.tr,
                        onTap: () {
                          setState(() {
                            pref.setInt("food", 1);
                            count = 1;
                          });
                        },
                        status: CustomButtonStatus.ELEVETED,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
