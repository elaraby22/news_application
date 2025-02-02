import 'package:news/model/SourceResponse.dart';

abstract class SourceState {}

class SourceLoadingState extends SourceState {}

class SourceErrorState extends SourceState {
  String errorMessage;

  SourceErrorState({required this.errorMessage});
}

class SourceSuccessState extends SourceState {
  List<Source> sourcesList;

  SourceSuccessState({required this.sourcesList});
}
