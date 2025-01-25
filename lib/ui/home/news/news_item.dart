import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/ui/home/news/news_item_bottom_sheet.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(news.publishedAt ?? '');
    final timeAgo = timeago.format(dateTime);
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        showNewsItemBottomSheet(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.01),
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.01),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: theme.indicatorColor, width: 2)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: double.infinity,
                height: height * 0.25,
                imageUrl: news.urlToImage ?? '',
                placeholder: (context, url) =>
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.greyColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              news.title ?? '',
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'By: ${news.author ?? ''}',
                    style: AppStyles.medium12Grey,
                  ),
                ),
                Text(
                  timeAgo,
                  style: AppStyles.medium12Grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void showNewsItemBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => NewsItemBottomSheet(
              news: news,
            ));
  }
}
