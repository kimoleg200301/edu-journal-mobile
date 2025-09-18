import 'package:dio/dio.dart';
import '../models/group_model.dart';

class GroupRemoteDataSource {
  final Dio dio;
  GroupRemoteDataSource(this.dio);

  Future<List<GroupModel>> getGroupList() async {
    final r = await dio.get('api/v1/groups/');
    final list = (r.data as List).cast<Map<String, dynamic>>();
    return list.map(GroupModel.fromJson).toList();
  }
}