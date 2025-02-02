import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import '../../../model/NewsResponse.dart';
import 'news_item.dart';

class SearchNewsScreen extends StatefulWidget {
  static const String routeName = 'search';

  @override
  State<SearchNewsScreen> createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  var searchController = TextEditingController();
  List<News> newsList = [];
  String message = "";
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: TextField(
                controller: searchController,
                style: theme.textTheme.headlineLarge,
                onEditingComplete: () {
                  getNewsBySearch();
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: theme.indicatorColor,
                    ),
                    hintText: 'Search',
                    hintStyle: theme.textTheme.headlineLarge,
                    suffixIcon: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                          color: theme.indicatorColor,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: theme.indicatorColor, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                            BorderSide(color: theme.indicatorColor, width: 2))),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            isSearching
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : newsList.isEmpty
                    ? Expanded(child: Center(child: Text(message)))
                    : Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return NewsItem(news: newsList[index]);
                            },
                            itemCount: newsList.length),
                      ),
          ],
        ),
      ),
    );
  }

  void getNewsBySearch() async {
    isSearching = true;
    setState(() {});
    String searchText = searchController.text;
    if (searchText.isNotEmpty) {
      NewsResponse? newsResponse = await ApiManager.searchNews(searchText);
      if (newsResponse!.status == "ok" && newsResponse.articles!.isNotEmpty) {
        newsList = newsResponse.articles!;
      } else {
        message = "No News Founded ";
      }
    } else {
      message = "Please Enter valid Search key ";
    }
    isSearching = false;
    setState(() {});
  }
}
