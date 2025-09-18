import 'package:flutter/foundation.dart';
import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';
import '../../../student/data/models/student_model.dart';

class StudentProvider extends ChangeNotifier {
  final StudentRepository repo;
  StudentProvider(this.repo);

  List<Student> items = [];
  Student? item;
  String? error;
  bool loading = false;

  Future<void> getStudentList() async {
    loading = true; error = null; notifyListeners();
    try {
      items = await repo.getStudentList();
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false; notifyListeners();
    }
  }

  Future<void> getStudentById(int student_id) async {
    loading = true; error = null; notifyListeners();
    try {
      item = await repo.getStudentById(student_id);
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false; notifyListeners();
    }
  }
}