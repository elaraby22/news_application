import 'package:flutter/material.dart';
import 'package:news/utils/app_styles.dart';

class SectionDrawerItem extends StatelessWidget {
  String imagePath;
  String text;

  SectionDrawerItem({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(imagePath),
          SizedBox(
            width: width * 0.02,
          ),
          Text(
            text,
            style: AppStyles.bold20White,
          )
        ],
      ),
    );
  }
}
