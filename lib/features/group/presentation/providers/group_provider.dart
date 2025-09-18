import 'package:flutter/foundation.dart';
import '../../domain/entities/group.dart';
import '../../domain/repositories/group_repository.dart';

class GroupProvider extends ChangeNotifier {
  final GroupRepository repo;
  GroupProvider(this.repo);

  List<Group> items = [];
  String? error;
  bool loading = false;

  Future<void> getGroupList() async {
    loading = true; error = null; notifyListeners();
    try {
      items = await repo.getGroupList();
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false; notifyListeners();
    }
  }
}