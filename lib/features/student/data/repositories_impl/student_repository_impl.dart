import '../../domain/entities/student.dart';
import '../../domain/repositories/student_repository.dart';
import '../datasources/student_remote_ds.dart';
import '../models/student_model.dart';

class StudentRepositoryImpl implements StudentRepository {
  final StudentRemoteDataSource remote;
  StudentRepositoryImpl(this.remote);

  @override
  Future<List<Student>> getStudentList() => remote.getStudentList();

  @override
  Future<Student?> getStudentById(int student_id) async => remote.getStudentById(student_id: student_id);

  @override
  Future<void> saveStudent(Student s) async => await remote.saveStudent(StudentModel.fromEntity(s));
  
  @override
  Future<void> updateStudent(Student s) async => await remote.updateStudent(StudentModel.fromEntity(s));

  @override
  Future<void> deleteStudent({required int student_id}) async => remote.deleteStudent(student_id: student_id);
}