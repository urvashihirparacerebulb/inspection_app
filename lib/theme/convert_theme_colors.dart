import 'package:flutter/material.dart';

import '../controllers/general_controller.dart';
import '../utility/color_utility.dart';

class ConvertTheme{
  static final ConvertTheme convertTheme = ConvertTheme._internal();

  factory ConvertTheme() {
    return convertTheme;
  }

  ConvertTheme._internal();

  Color getTextFiledBackGroundColor() {
    return GeneralController.to.isDarkMode.value ? darkThemePrimaryColor : textFieldColor;
  }

  Color getBackGroundColor() {
    return GeneralController.to.isDarkMode.value ? darkThemePrimaryColor : bgColor;
  }

  Color getWhiteToFontColor() {
    return whiteColor;
  }

  // Color getFontToWhiteColor() {
  //   return GeneralController.to.isDarkMode.value ? fontColor : whiteColor;
  // }
}