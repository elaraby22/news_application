import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/repository/news/dataSources/news_remote_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId, String pageSize) {
    return apiManager.getNewsBySourceId(sourceId, pageSize);
  }
}
