import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/components/custom_button.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_restaurant_app/models/food_model.dart';
import 'package:flutter_restaurant_app/models/popular_model.dart';
import 'package:flutter_restaurant_app/view/home/details_screen.dart';
import 'package:flutter_restaurant_app/view/profile/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FoodModel> foodList = [
    FoodModel(Assets.image.food1, "Food1", "Some Details", "250"),
    FoodModel(Assets.image.food2, "Food2", "Some Details", "285"),
    FoodModel(Assets.image.food1, "Food3", "Some Details", "300"),
    FoodModel(Assets.image.food2, "Food4", "Some Details", "320"),
  ];
  List<PopularModel> popularList = [
    PopularModel(Assets.image.food3, "Mo:mo", "Rs. 250"),
    PopularModel(Assets.image.food3, "Mo:mo", "Rs. 200"),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return Container(
      width: 1.sw(context),
      height: 1.sh(context),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 32.w,
                    height: 32.h,
                  ),
                  SvgPicture.asset(Assets.icon.logo_text),
                  Container(
                    width: 34.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.o),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        pushTo(ProfileScreen(), context);
                      },
                      child: Image.asset(
                        Assets.image.person,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            50.o.gapY,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.o),
              padding: EdgeInsets.all(10.o),
              width: 1.sw(context),
              height: 180.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff004422),
                      Color(0xffD9FFEC),
                    ]),
                borderRadius: BorderRadius.circular(10.o),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Assets.image.burger),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offerTitle.tr,
                    style: theme.testStyle.copyWith(
                      color: theme.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  5.o.gapY,
                  Text(
                    offerDes.tr,
                    style: theme.testStyle.copyWith(
                      color: theme.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  5.o.gapY,
                  CustomButton(
                    title: buyNow.tr,
                    backgroundColor: theme.white,
                    textColor: theme.green,
                    onTap: () {},
                    size: Size(140.o, 27.o),
                    borderRadius: 5,
                    textSize: 12,
                    status: CustomButtonStatus.ELEVETED,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bestOffers.tr,
                    style: theme.testStyle.copyWith(
                      color: tema.primaryColorDark,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      seeAll.tr,
                      style: theme.testStyle.copyWith(
                        color: theme.green,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    iconAlignment: IconAlignment.end,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: theme.green,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 267.h,
              width: 1.sw(context),
              child: ListView.builder(
                itemCount: foodList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      pushTo(DetailsScreen(), context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.o),
                      width: 124.w,
                      height: 235.h,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: 102.w,
                              height: 168.h,
                              margin: EdgeInsets.all(10.o),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xff009944),
                                  width: 1.o,
                                ),
                                color: tema.focusColor,
                                borderRadius: BorderRadius.circular(16.o),
                                boxShadow: [
                                  BoxShadow(
                                    color: theme.grey.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    foodList[index].title,
                                    style: theme.testStyle.copyWith(
                                      color: tema.primaryColorDark,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  10.o.gapY,
                                  Text(
                                    foodList[index].description,
                                    style: theme.testStyle.copyWith(
                                      color: theme.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  10.o.gapY,
                                  Text(
                                    foodList[index].price,
                                    style: theme.testStyle.copyWith(
                                      color: theme.green,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  18.o.gapY,
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.all(10.o),
                              width: 124.w,
                              height: 124.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(62.o),
                                color: tema.focusColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: theme.grey.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                foodList[index].image,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    popularFood.tr,
                    style: theme.testStyle.copyWith(
                      color: tema.primaryColorDark,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      seeAll.tr,
                      style: theme.testStyle.copyWith(
                        color: theme.green,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    iconAlignment: IconAlignment.end,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: theme.green,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 110.h,
              width: 1.sw(context),
              child: ListView.builder(
                itemCount: popularList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 212.w,
                    height: 86.h,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.o),
                      color: tema.focusColor,
                      boxShadow: [
                        BoxShadow(
                          color: theme.grey.withValues(alpha: 0.3),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 100.w,
                          height: 1.sh(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.o),
                          ),
                          child: Image.asset(
                            popularList[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        18.o.gapx,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              popularList[index].title,
                              style: theme.testStyle.copyWith(
                                color: tema.primaryColorDark,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            8.o.gapY,
                            Text(
                              popularList[index].description,
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
                  );
                },
              ),
            ),
            40.o.gapY,
          ],
        ),
      ),
    );
  }
}
