import 'package:news/repository/news/dataSources/news_remote_data_source.dart';
import 'package:news/repository/news/dataSources/news_remote_data_source_impl.dart';
import 'package:news/repository/news/repository/news_repository.dart';
import 'package:news/repository/news/repository/news_repository_impl.dart';
import 'package:news/repository/source/dataSources/source_remote_data_source_impl.dart';
import 'package:news/repository/source/repository/source_repository.dart';
import 'package:news/repository/source/repository/source_repository_impl.dart';

import '../api/api_manager.dart';
import '../repository/source/dataSources/source_remote_data_source.dart';

SourceRepository injectSourceRepository() {
  return SourceRepositoryImpl(
      sourceRemoteDataSource: injectSourceRemoteDataSource());
}

SourceRemoteDataSource injectSourceRemoteDataSource() {
  return SourceRemoteDataSourceImpl(apiManager: injectApiManager());
}

ApiManager injectApiManager() {
  return ApiManager();
}

NewsRepository injectNewsRepository() {
  return NewsRepositoryImpl(newsRemoteDataSource: injectNewsRemoteDataSource());
}

NewsRemoteDataSource injectNewsRemoteDataSource() {
  return NewsRemoteDataSourceImpl(apiManager: injectApiManager());
}
