import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_sphere/helper/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle germaniaOne() {
    return TextStyle(
        fontSize: 12.sp,
        color: MyColors.white,
        fontWeight: FontWeight.w500,
        fontFamily: 'GermaniaOne');
  }

  static TextStyle mulish(
      {required double fontSize, required FontWeight fontWeight}) {
    return TextStyle(
        fontFamily: 'Mulish',
        fontSize: fontSize,
        color: MyColors.white,
        fontWeight: fontWeight);
  }

  static TextStyle chivo({required double fontSize}) {
    return TextStyle(
        fontFamily: 'Chivo',
        fontSize: fontSize,
        color: MyColors.white,
        fontWeight: FontWeight.w500);
  }
}
