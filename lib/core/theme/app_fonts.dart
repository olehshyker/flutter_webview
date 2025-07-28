import 'package:flutter/material.dart';
import 'package:flutter_webview/core/theme/app_colors.dart';

abstract class AppFonts {
  static const String fontFamily = 'Poppins';
  static const TextStyle regular = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    letterSpacing: 0.1,
  );

  static const TextStyle medium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    letterSpacing: 0.1,
  );

  static const TextStyle bold = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    letterSpacing: 0.1,
  );
}