import 'package:flutter/material.dart';

class AppScreenUtil {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double verticalSpacerHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02;
  }

  static double horizontalSpacerHeight(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.02;
  }
}
