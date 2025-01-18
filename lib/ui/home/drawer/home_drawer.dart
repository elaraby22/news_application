import 'package:flutter/material.dart';
import 'package:news/provider/app_language_provider.dart';
import 'package:news/provider/app_theme_provider.dart';
import 'package:news/ui/home/drawer/language_bottom_sheet.dart';
import 'package:news/ui/home/drawer/section_drawer_item.dart';
import 'package:news/ui/home/drawer/theme_bottom_sheet.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:news/utils/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  Function onDrawerItemClicked;

  HomeDrawer({required this.onDrawerItemClicked});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Column(
      children: [
        Container(
          color: AppColors.whiteColor,
          alignment: Alignment.center,
          height: height * 0.22,
          width: double.infinity,
          child: Text(
            AppLocalizations.of(context)!.news_app,
            style: AppStyles.bold24Black,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        InkWell(
            onTap: () {
              //todo: go to home
              onDrawerItemClicked();
            },
            child: SectionDrawerItem(
                imagePath: AssetsManager.homeIcon,
                text: AppLocalizations.of(context)!.go_to_home)),
        SizedBox(
          height: height * 0.02,
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.04,
          endIndent: width * 0.04,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SectionDrawerItem(
            imagePath: AssetsManager.themeIcon,
            text: AppLocalizations.of(context)!.theme),
        SizedBox(
          height: height * 0.01,
        ),
        InkWell(
          onTap: () {
            showThemeBottomSheet(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.04),
            margin: EdgeInsets.symmetric(horizontal: width * 0.03),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.whiteColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  themeProvider.isDarkMode()
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light,
                  style: AppStyles.medium20White,
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.whiteColor,
                  size: 30,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Divider(
          color: AppColors.whiteColor,
          thickness: 2,
          indent: width * 0.04,
          endIndent: width * 0.04,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        SectionDrawerItem(
            imagePath: AssetsManager.languageIcon,
            text: AppLocalizations.of(context)!.language),
        SizedBox(
          height: height * 0.01,
        ),
        InkWell(
          onTap: () {
            showLanguageBottomSheet(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.04),
            margin: EdgeInsets.symmetric(horizontal: width * 0.03),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.whiteColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  languageProvider.appLanguage == 'en'
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic,
                  style: AppStyles.medium20White,
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.whiteColor,
                  size: 30,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
