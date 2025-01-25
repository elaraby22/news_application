import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsItemBottomSheet extends StatefulWidget {
  News news;

  NewsItemBottomSheet({required this.news});

  @override
  State<NewsItemBottomSheet> createState() => _NewsItemBottomSheetState();
}

class _NewsItemBottomSheetState extends State<NewsItemBottomSheet> {

  late WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.news.url ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.02
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: widget.news.urlToImage ?? '',
              placeholder: (context, url) =>
                  CircularProgressIndicator(
                    color: AppColors.greyColor,
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),),
          SizedBox(height: height * 0.02,),
          Text(widget.news.content ?? '',
            style: AppStyles.medium14Black,),
          SizedBox(height: height * 0.02,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blackColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.02
                  )
              ),
              onPressed: () {
                goToWebView();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('View Full Article',
                    style: AppStyles.bold16White,),
                ],
              )
          )
        ],
      ),
    );
  }

  void goToWebView() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            SafeArea(child: WebViewWidget(controller: controller))));
  }
}
