import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double paddingTop;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    paddingTop = _mediaQueryData.viewPadding.top;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double? getProportionateScreenHeight(double? inputHeight) {
  var screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  if (inputHeight != null) {
    return (inputHeight / 812.0) * screenHeight;
  }
  return null;
}

// Get the proportionate height as per screen size
double? getProportionateScreenWidth(double? inputWidth) {
  var screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  if (inputWidth != null) {
    return (inputWidth / 375.0) * screenWidth;
  }
  return null;
}