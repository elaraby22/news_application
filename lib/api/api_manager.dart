import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManager {
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=ca769b04eed9485e82aedaf7aec67fa0
   */
  Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstants.apiKey, 'category': categoryId});
    // String => json => object
    try {
      var response = await http.get(url);
      var responseBody = response.body; // String
      var json = jsonDecode(responseBody); // json
      return SourceResponse.fromJson(json); // object
      // SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=ca769b04eed9485e82aedaf7aec67fa0
   */

  Future<NewsResponse?> getNewsBySourceId(String sourceId,
      String pageSize) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
      'pageSize': pageSize
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
      // NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }


  static Future<NewsResponse?> searchNews(String search) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'q': search
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
      // NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
