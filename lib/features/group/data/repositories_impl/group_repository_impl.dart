import '../../domain/entities/group.dart';
import '../../domain/repositories/group_repository.dart';
import '../datasources/group_remote_ds.dart';
import '../models/group_model.dart';

class GroupRepositoryImpl implements GroupRepository {
  final GroupRemoteDataSource remote;
  GroupRepositoryImpl(this.remote);

  @override
  Future<List<Group>> getAll() => remote.getAll();
}