import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/repository/source/dataSources/source_remote_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response;
  }

}