import 'package:flutter/material.dart';
import 'package:flutter_restaurant_app/common/helpers/export.dart';
import 'package:flutter_restaurant_app/common/helpers/translate.dart';
import 'package:flutter_restaurant_app/models/category_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<CategoryModel> categoryList = [
    CategoryModel(Assets.image.img1, "Fast Food"),
    CategoryModel(Assets.image.img2, "Burgers"),
    CategoryModel(Assets.image.img3, "Mexican"),
    CategoryModel(Assets.image.img4, "Deserts"),
  ];
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ThemeData tema = Theme.of(context);
    return SafeArea(
      child: Column(
        children: [
          20.o.gapY,
          Align(
            alignment: Alignment.center,
            child: Text(
              search.tr,
              style: theme.testStyle.copyWith(
                color: tema.primaryColorDark,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          14.o.gapY,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.o),
            height: 48,
            child: TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    Assets.icon.voice,
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
                hintText: "${search.tr}...",
                hintStyle: theme.testStyle.copyWith(
                  fontSize: 14,
                  color: tema.primaryColorDark,
                ),
              ),
            ),
          ),
          14.o.gapY,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                topCategories.tr,
                style: theme.testStyle.copyWith(
                  color: tema.primaryColorDark,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          14.o.gapY,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 160.w,
                    height: 160.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.o),
                      image: DecorationImage(
                          image: AssetImage(categoryList[index].image),
                          fit: BoxFit.cover),
                    ),
                    child: Container(
                      width: 160.w,
                      height: 160.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.o),
                        color: theme.black.withValues(alpha: 0.5),
                      ),
                      child: Center(
                        child: Text(
                          categoryList[index].title,
                          style: theme.testStyle.copyWith(
                            color: theme.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
