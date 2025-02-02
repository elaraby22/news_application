import 'package:news/model/NewsResponse.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse?> getNewsBySourceId(String sourceId, String pageSize);
}
