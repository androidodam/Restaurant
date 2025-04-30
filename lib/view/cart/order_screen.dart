import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/components/custom_button.dart';
import 'package:flutter_restaurant_app/common/components/custom_outlined_button.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/status.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: tema.scaffoldBackgroundColor,
        body: Container(
          width: 1.sw(context),
          height: 1.sh(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                Theme.of(context).brightness == Brightness.dark
                    ? Assets.image.pattern_dark
                    : Assets.image.pattern,
              ),
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  150.o.gapY,
                  Center(
                    child: Image.asset(
                      Assets.image.complete,
                      width: 170.w,
                      height: 170.h,
                    ),
                  ),
                  Text(
                    thankYou.tr,
                    textAlign: TextAlign.center,
                    style: theme.testStyle.copyWith(
                      color: tema.primaryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                left: 20,
                child: Column(
                  children: [
                    RatingBar.builder(
                      initialRating: 3, // Boshlang'ich yulduzlar soni
                      minRating: 1,
                      itemSize: 24,
                      unratedColor: Color(0xffFEAD1D).withValues(alpha: 0.2),
                      direction: Axis.horizontal,
                      allowHalfRating: true, // Yarim yulduzga ruxsat
                      itemCount: 5, // Nechta yulduz ko'rsatish
                      itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
                      itemBuilder: (context, _) {
                        return SvgPicture.asset(
                          Assets.icon.star,
                          colorFilter: ColorFilter.mode(
                            Color(0xffFEAD1D),
                            BlendMode.srcIn,
                          ),
                        );
                      },
                      onRatingUpdate: (value) {},
                    ),
                    20.o.gapY,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: tema.focusColor),
                      height: 48,
                      child: TextFormField(
                        controller: _textController,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: SvgPicture.asset(
                              Assets.icon.edit_icon,
                              colorFilter: ColorFilter.mode(
                                tema.primaryColorDark,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.o),
                            borderSide: BorderSide(
                              color: theme.grey,
                              width: 1.o,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.o),
                            borderSide: BorderSide(
                              color: theme.grey,
                              width: 1.o,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.o),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1.o,
                            ),
                          ),
                          hintText: feedback.tr,
                          hintStyle: theme.testStyle.copyWith(
                            fontSize: 14,
                            color: tema.primaryColorDark,
                          ),
                        ),
                      ),
                    ),
                    20.o.gapY,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomButton(
                            title: submit.tr,
                            onTap: () {},
                            status: CustomButtonStatus.ELEVETED,
                          ),
                        ),
                        20.o.gapx,
                        CustomOutlinedButton(
                          size: Size(130.o, 48.o),
                          title: skip.tr,
                          status: CustomButtonStatus.ELEVETED,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
