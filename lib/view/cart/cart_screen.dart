import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/components/custom_button.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_restaurant_app/main.dart';
import 'package:flutter_restaurant_app/models/food_model.dart';
import 'package:flutter_restaurant_app/view/cart/order_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 0;
  @override
  void initState() {
    count = pref.getInt("food") ?? 0;
    super.initState();
  }

  List<FoodModel> foodList = [
    FoodModel(Assets.image.burger_detail, "Chicken Burger",
        "Burger Factory LTD", "200"),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              10.o.gapY,
              Align(
                alignment: Alignment.center,
                child: Text(
                  cart.tr,
                  style: theme.testStyle.copyWith(
                    color: tema.primaryColorDark,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              40.o.gapY,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    orderDetails.tr,
                    style: theme.testStyle.copyWith(
                      color: tema.primaryColorDark,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              6.o.gapY,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: count != 0
                      ? ListView.builder(
                          itemCount: foodList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              width: 1.sw(context),
                              height: 100.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.o),
                                color: tema.focusColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: theme.grey.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 64.w,
                                    height: 64.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.o),
                                      image: DecorationImage(
                                          image:
                                              AssetImage(foodList[index].image),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  10.o.gapx,
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          foodList[index].title,
                                          style: theme.testStyle.copyWith(
                                            color: tema.primaryColorDark,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        2.o.gapY,
                                        Text(
                                          foodList[index].description,
                                          style: theme.testStyle.copyWith(
                                            color: tema.primaryColorDark,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        2.o.gapY,
                                        Text(
                                          "Rs ${foodList[index].price}",
                                          style: theme.testStyle.copyWith(
                                            color: theme.greenDark,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  10.o.gapx,
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (count >= 1) {
                                            setState(() {
                                              count--;
                                              if (count == 0) {
                                                foodList.removeAt(0);
                                                pref.setInt("food", 0);
                                              }
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: 27.w,
                                          height: 27.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: theme.grey,
                                          ),
                                          child: Icon(
                                            Icons.remove,
                                            color: theme.greenDark,
                                          ),
                                        ),
                                      ),
                                      8.o.gapx,
                                      Text(
                                        "${count}",
                                        style: theme.testStyle.copyWith(
                                          color: theme.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      8.o.gapx,
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            count++;
                                            pref.setInt("food", count);
                                          });
                                        },
                                        child: Container(
                                          width: 27.w,
                                          height: 27.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: theme.greenDark,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: theme.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Container(
                          child: Center(
                              child: Text(
                            productNotAvailable.tr,
                            style: theme.testStyle.copyWith(
                                color: tema.primaryColorDark, fontSize: 14),
                          )),
                        ),
                ),
              ),
            ],
          ),
          count != 0
              ? Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    width: 1.sw(context),
                    height: 135.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: theme.greenDark,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                total.tr,
                                style: theme.testStyle.copyWith(
                                  color: theme.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Rs ${int.parse(foodList[0].price) * count}",
                                style: theme.testStyle.copyWith(
                                  color: theme.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          CustomButton(
                            onTap: () {
                              pushTo(OrderScreen(), context);
                            },
                            backgroundColor: theme.white,
                            textColor: theme.black,
                            title: placeMyOrder.tr,
                            status: CustomButtonStatus.ELEVETED,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
