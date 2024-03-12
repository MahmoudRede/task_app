import 'package:flutter/material.dart';
import 'package:task_app/styles/size_config/app_size_config.dart';

class FontConstant {
  static const String fontFamily = '';
}

class FontWeightManager {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  //#region headline 1 Size
  static double headline1Size = SizeConfig.height * 0.028 ; //40 px
//#endregion

  //#region headline 2 Size
  static double headline2Size = SizeConfig.height * 0.023; // 25 px
//#endregion

  //#region headline 3 Size
  static double headline3Size = SizeConfig.height * 0.017; // 20 px
//#endregion

  //#region headline 4 Size
  static double headline4Size = SizeConfig.height * 0.015 ; //18 px
//#endregion

  //#region headline 5 Size
  static double headline5Size = SizeConfig.height * 0.013; //16 px
//#endregion

  //#region headline 6 Size
  static double headline6Size = SizeConfig.height * 0.011 ; //14 px
//#endregion

  //#region subtitle1 Size
  static double subtitle1Size = SizeConfig.height * 0.008 ; //12 px
//#endregion

  //#region subtitle 2 Size
  static double subtitle2Size = SizeConfig.height * 0.01079 ; //10 px
//#endregion

  //#region subtitle 3 Size
  static double subtitle3Size = SizeConfig.height * 0.01 ; //8 px
//#endregion
}