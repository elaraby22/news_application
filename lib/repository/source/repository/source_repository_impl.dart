import 'package:news/model/SourceResponse.dart';
import 'package:news/repository/source/dataSources/source_remote_data_source.dart';
import 'package:news/repository/source/repository/source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource sourceRemoteDataSource;

  SourceRepositoryImpl({required this.sourceRemoteDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var response = await sourceRemoteDataSource.getSources(categoryId);
    return response;
  }
}
