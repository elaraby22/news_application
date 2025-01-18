import 'package:flutter/material.dart';
import 'package:news/utils/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;

  CategoryModel(
      {required this.id, required this.title, required this.imagePath});

  static List<CategoryModel> getCategoriesList(
      bool isDark, BuildContext context) {
    return [
      CategoryModel(
          id: 'general',
          title: AppLocalizations.of(context)!.general,
          imagePath: isDark
              ? AssetsManager.generalLightImage
              : AssetsManager.generalDarkImage),
      CategoryModel(
          id: 'business',
          title: AppLocalizations.of(context)!.business,
          imagePath: isDark
              ? AssetsManager.businessLightImage
              : AssetsManager.businessDarkImage),
      CategoryModel(
          id: 'sports',
          title: AppLocalizations.of(context)!.sports,
          imagePath: isDark
              ? AssetsManager.sportsLightImage
              : AssetsManager.sportsDarkImage),
      CategoryModel(
          id: 'technology',
          title: AppLocalizations.of(context)!.technology,
          imagePath: isDark
              ? AssetsManager.technologyLightImage
              : AssetsManager.technologyDarkImage),
      CategoryModel(
          id: 'entertainment',
          title: AppLocalizations.of(context)!.entertainment,
          imagePath: isDark
              ? AssetsManager.entertainmentLightImage
              : AssetsManager.entertainmentDarkImage),
      CategoryModel(
          id: 'health',
          title: AppLocalizations.of(context)!.health,
          imagePath: isDark
              ? AssetsManager.healthLightImage
              : AssetsManager.healthDarkImage),
      CategoryModel(
          id: 'science',
          title: AppLocalizations.of(context)!.science,
          imagePath: isDark
              ? AssetsManager.scienceLightImage
              : AssetsManager.scienceDarkImage),
    ];
  }
}
