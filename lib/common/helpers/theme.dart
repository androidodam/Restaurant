import 'package:flutter/material.dart';

_ThemeApp? _appTheme;

_ThemeApp get theme {
  _appTheme ??= _ThemeApp();
  return _appTheme!;
}

void updateTheme() {
  _appTheme = _ThemeApp();
}

class _ThemeApp {
  Color tr = Colors.transparent;
  Color black = const Color(0xff000000);
  Color white = const Color(0xffffffff);
  Color green = const Color(0xff009944);
  Color greenDark = const Color(0xff004422);
  Color blueLight = const Color(0xffBBFFDD);
  Color grey = Colors.grey;
  Color greyAccent1 = const Color(0xffA7A7A7);
  Color greyAccent2 = const Color(0xff707070);
  Color greyAccent3 = const Color(0xff383838);

//All fonts
  String fontPoppins = "Poppins";

  TextStyle testStyle = const TextStyle(
    color: Color(0xff000000),
    overflow: TextOverflow.ellipsis,
    decoration: TextDecoration.none,
    fontFamily: "Manrope",
  );

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffffffff),
    primaryColorDark: Color(0xff000000),
    primaryColor: Color(0xff009944),
    cardColor: Color(0xff000000),
    canvasColor: Color(0xff009944),
    focusColor: Color(0xffffffff),
    useMaterial3: true,
  );

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff1F303E),
    primaryColorDark: Color(0xffffffff),
    primaryColor: Color(0xffffffff),
    cardColor: Color(0xffffffff),
    canvasColor: Color(0xff1F303E),
    focusColor: Color(0xff142737),
    useMaterial3: true,
  );
}
