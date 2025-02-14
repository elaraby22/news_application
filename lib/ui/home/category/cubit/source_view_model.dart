import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/repository/source/repository/source_repository.dart';
import 'package:news/ui/home/category/cubit/source_states.dart';

class SourceViewModel extends Cubit<SourceState> {
  SourceRepository sourceRepository;

  SourceViewModel({required this.sourceRepository})
      : super(SourceLoadingState());

  //todo: hold data / handle logic
  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId);
      if (response!.status == 'error') {
        emit(SourceErrorState(errorMessage: response.message!));
        return;
      }
      if (response.status == 'ok') {
        emit(SourceSuccessState(sourcesList: response.sources!));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
