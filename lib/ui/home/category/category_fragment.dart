import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/model/category_model.dart';
import 'package:news/provider/app_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoriesList = [];
  Function onViewAllClicked;

  CategoryFragment({required this.onViewAllClicked});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    categoriesList =
        CategoryModel.getCategoriesList(themeProvider.isDarkMode(), context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.good_morning,
            style: theme.textTheme.headlineMedium,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: index % 2 == 0
                          ? Alignment.bottomRight
                          : Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child:
                                Image.asset(categoriesList[index].imagePath)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.02,
                              vertical: height * 0.01),
                          child: ToggleSwitch(
                            customWidgets: [
                              Text(
                                AppLocalizations.of(context)!.view_all,
                                style: theme.textTheme.headlineLarge,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: theme.indicatorColor,
                              )
                            ],
                            animate: true,
                            customWidths: [width * 0.25, width * 0.15],
                            cornerRadius: 20.0,
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            totalSwitches: 2,
                            onToggle: (index1) {
                              onViewAllClicked(categoriesList[index]);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: height * 0.02,
                    );
                  },
                  itemCount: categoriesList.length))
        ],
      ),
    );
  }
}
