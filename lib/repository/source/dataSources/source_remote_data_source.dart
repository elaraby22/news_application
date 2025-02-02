import 'package:news/model/SourceResponse.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getSources(String categoryId);
}