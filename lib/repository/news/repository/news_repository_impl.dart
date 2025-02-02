import 'package:news/model/NewsResponse.dart';
import 'package:news/repository/news/dataSources/news_remote_data_source.dart';
import 'package:news/repository/news/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId, String pageSize) {
    return newsRemoteDataSource.getNewsBySourceId(sourceId, pageSize);
  }
}
