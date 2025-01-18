import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.whiteColor,
      indicatorColor: AppColors.blackColor,
      scaffoldBackgroundColor: AppColors.whiteColor,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
          iconTheme: IconThemeData(color: AppColors.blackColor)),
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16Black,
          labelMedium: AppStyles.medium14Black,
          headlineMedium: AppStyles.medium24Black,
          headlineLarge: AppStyles.medium20Black));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.blackColor,
      indicatorColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.blackColor,
          iconTheme: IconThemeData(color: AppColors.whiteColor)),
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16White,
          labelMedium: AppStyles.medium14White,
          headlineMedium: AppStyles.medium24White,
          headlineLarge: AppStyles.medium20White));
}
