import 'package:flutter/material.dart';

class Styles {
  const Styles._();

  static const edgeInsetsXS = 3.0;
  static const edgeInsetsS = 6.0;
  static const edgeInsetsMS = 10.0;
  static const edgeInsetsM = 12.0;
  static const edgeInsetsL = 24.0;
  static const edgeInsetsML = 30.0;
  static const edgeInsetsXL = 42.0;
  static const edgeInsetsXXL = 60.0;

  static const headerHeight = 80.0;

  static const primaryColor = Color(0xFFFFC600); //Color(0xff43BD99);
  static const white = Colors.white;
  static const black = Color(0xFF1B1D1C);
  static const red = Color(0xFFE53939);
  static const green = Color(0xFF6ACC74);
  static const lightGrey = Color(0xFFD8D8D8);
  static const menuText = Color(0xFFF1F1F9);
  static const darkGrey = Color(0xFF707070);
  static const lightScaffoldBackground = Color(0xFFF3F3F3);

  // static BoxDecoration boxDecoration({
  //   Color color = white,
  //   Color borderColor = lightGrey,
  //   double borderWidth = 1,
  //   double radius = borderRaduisM,
  //   bool removeBorder = false,
  //   bool removeShadow = false,
  //   Gradient gradient,
  //   double blurRadius = 3.0,
  //   double offset = 3.0,
  // }) =>
  //     BoxDecoration(
  //         gradient: gradient,
  //         borderRadius: BorderRadius.all(Radius.circular(radius)),
  //         color: color,
  //         border: removeBorder
  //             ? null
  //             : Border.all(color: borderColor, width: borderWidth),
  //         boxShadow: removeShadow
  //             ? null
  //             : [
  //           BoxShadow(
  //             offset: Offset(0.0, offset),
  //             color: Colors.grey[400],
  //             blurRadius: blurRadius,
  //           )
  //         ]);

  static const _textTheme = TextTheme(
    headline1: TextStyle(
        color: Colors.black, fontSize: 40, fontWeight: FontWeight.normal),
    headline2: TextStyle(
        color: Colors.black, fontSize: 35, fontWeight: FontWeight.normal),
    headline3: TextStyle(color: Colors.black, fontSize: 26),
    headline4: TextStyle(color: Colors.black, fontSize: 23),
    headline5: TextStyle(color: Colors.black, fontSize: 21),
    headline6: TextStyle(color: Colors.black, fontSize: 19),
    subtitle1: TextStyle(color: Colors.black, fontSize: 17),
    subtitle2: TextStyle(color: Colors.black, fontSize: 16),
    bodyText1: TextStyle(color: Colors.black, fontSize: 14),
    bodyText2: TextStyle(color: Colors.black, fontSize: 12),
    caption: TextStyle(color: Colors.black, fontSize: 18),
    button: TextStyle(color: Colors.black, fontSize: 18),
    overline: TextStyle(color: Colors.black, fontSize: 18),
  );

  static final _buttonTheme = ButtonThemeData(
    splashColor: darkGrey,
    buttonColor: white,
    disabledColor: white,
    textTheme: ButtonTextTheme.normal,
    height: 40,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3),
    ),
  );

  static theme() => ThemeData(
        primaryColor: primaryColor,
        disabledColor: darkGrey,
        buttonColor: primaryColor,
        scaffoldBackgroundColor: lightScaffoldBackground,
        buttonTheme: _buttonTheme,
        accentColor: white,
        textTheme: _textTheme.apply(fontFamily: 'Circular-Std-Book'),
        primaryTextTheme: _textTheme.apply(
            bodyColor: primaryColor,
            displayColor: primaryColor,
            fontFamily: 'Circular-Std-Book'),
        accentTextTheme: _textTheme.apply(
            bodyColor: white, displayColor: white, fontFamily: 'Circular-Std-Book'),
      );
}
