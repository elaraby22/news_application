import 'package:news/model/NewsResponse.dart';

abstract class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {
  String errorMessage;

  NewsErrorState({required this.errorMessage});
}

class NewsSuccessState extends NewsState {}

class NewsFromPagination extends NewsState {}
