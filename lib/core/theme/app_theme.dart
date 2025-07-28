import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

part 'fonts.dart';

TextTheme get textTheme => AppTheme.defaultTheme.textTheme;

ThemeData get theme => AppTheme.defaultTheme;

class AppTheme {
  static ThemeData get defaultTheme {
    return ThemeData.dark().copyWith(
        textTheme: _Fonts().defaultTextTheme,
        scaffoldBackgroundColor: AppColors.balticSea,
        dividerColor: AppColors.dividerColor,
        primaryColor: AppColors.balticSea,
        hintColor: AppColors.hintColor,
        indicatorColor: AppColors.indicatorColor,
        disabledColor: AppColors.disabledColor,
        // errorColor: AppColors.errorColor,
        canvasColor: AppColors.balticSea,
        cardColor: AppColors.cardColor,
        dialogBackgroundColor: AppColors.tuna);
  }
}
