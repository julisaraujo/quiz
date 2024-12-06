import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class ScreenUtil {
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getNavigationBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getUsableScreenHeight(BuildContext context) {
    double screenHeight = getScreenHeight(context);
    double statusBarHeight = getStatusBarHeight(context);
    double navigationBarHeight = getNavigationBarHeight(context);
    return screenHeight - statusBarHeight - navigationBarHeight;
  }

  static double getScreenDiagonalInInches(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double widthToRatio = screenWidth * pixelRatio;
    double heightToRatio = screenHeight * pixelRatio;
    double diagonal =
        math.sqrt(math.pow(widthToRatio, 2) + math.pow(heightToRatio, 2));
    double dpi = pixelRatio * 160;
    double diagonalInInches = diagonal / dpi;
    return diagonalInInches;
  }

  static bool isScreenLargerThan5Inches(BuildContext context) {
    double screenDiagonalInInches = getScreenDiagonalInInches(context);
    return screenDiagonalInInches > 5.0;
  }
}
