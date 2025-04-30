import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_restaurant_app/view/cart/cart_screen.dart';
import 'package:flutter_restaurant_app/view/home/home_screen.dart';
import 'package:flutter_restaurant_app/view/search/search_screen.dart';
import 'package:flutter_svg/svg.dart';

class Bnb extends StatefulWidget {
  const Bnb({super.key});

  @override
  State<Bnb> createState() => _BnbState();
}

class _BnbState extends State<Bnb> {
  int selectedIndex = 0;
  List pages = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
  ];

  List imageItem = [
    Assets.icon.home,
    Assets.icon.search,
    Assets.icon.cart,
  ];

  List<String> getTitleItems(BuildContext context) {
    return [home.tr, search.tr, cart.tr];
  }

  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: tema.scaffoldBackgroundColor,
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        width: 1.sw(context),
        height: 70.h,
        decoration: BoxDecoration(
          color: tema.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: theme.grey.withValues(alpha: 0.3),
              blurRadius: 7,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            pages.length,
            (index) {
              return Column(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    icon: SvgPicture.asset(
                      imageItem[index],
                      colorFilter: ColorFilter.mode(
                        selectedIndex == index
                            ? tema.cardColor
                            : theme.grey.withValues(alpha: 0.6),
                        BlendMode.srcIn,
                      ),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Text(
                    getTitleItems(context)[index],
                    style: theme.testStyle.copyWith(
                        fontSize: 12.o,
                        color: selectedIndex == index
                            ? tema.cardColor
                            : theme.grey.withValues(alpha: 0.6)),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ));
  }
}
