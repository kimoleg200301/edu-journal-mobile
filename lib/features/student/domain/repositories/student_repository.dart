import '../entities/student.dart';
import '../../data/models/student_model.dart';

abstract class StudentRepository {
  Future<List<Student>> getStudentList();
  Future<Student?> getStudentById(int student_id);
  Future<void> saveStudent(Student s);
  Future<void> updateStudent(Student s);
  Future<void> deleteStudent({required int student_id});
}