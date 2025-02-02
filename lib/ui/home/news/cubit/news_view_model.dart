import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/repository/news/repository/news_repository.dart';
import 'package:news/ui/home/news/cubit/news_states.dart';

import '../../../../model/NewsResponse.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsRepository newsRepository;

  NewsViewModel({required this.newsRepository}) : super(NewsLoadingState());

  //todo: hold data / handle logic
  List<News>? newsList;
  int pageSize = 3;

  void getNewsBySourceId(String sourceId, {bool fromLoading = false}) async {
    if (fromLoading) {
      emit(NewsFromPagination());
    } else {
      emit(NewsLoadingState());
    }
    try {
      var response =
          await newsRepository.getNewsBySourceId(sourceId, '$pageSize');
      if (response!.status == 'error') {
        emit(NewsErrorState(errorMessage: response.message!));
        return;
      }
      if (response.status == 'ok') {
        emit(NewsSuccessState());
        newsList = response.articles;
        if (newsList!.isNotEmpty) {
          pageSize += 3;
        }
        return;
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
