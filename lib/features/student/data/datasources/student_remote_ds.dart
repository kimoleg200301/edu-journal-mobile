import 'package:dio/dio.dart';
import '../models/student_model.dart';

class StudentRemoteDataSource {
  final Dio dio;
  StudentRemoteDataSource(this.dio);
  final String baseApiUrl = 'api/v1/students';

  Future<List<StudentModel>> getStudentList() async {
    final r = await dio.get('$baseApiUrl/');
    final list = (r.data as List).cast<Map<String, dynamic>>();
    return list.map(StudentModel.fromJson).toList();
  }

  Future<StudentModel?> getStudentById({required int student_id}) async {
    final r = await dio.get('$baseApiUrl/info_student?student_id', queryParameters: {
      'student_id': student_id,
    });
    if (r.data == null) return null;
    return StudentModel.fromJson(r.data as Map<String, dynamic>);
  }

  Future<String> saveStudent(StudentModel s) async {
    final r = await dio.post('$baseApiUrl/save_student', data: s.toJson());
    return r.data?.toString() ?? 'OK';
  }

  Future<String> updateStudent(StudentModel s) async {
    final r = await dio.put('$baseApiUrl/update_student', data: s.toJson());
    return r.data?.toString() ?? 'OK';
  }

  Future<String> deleteStudent({required int student_id}) async {
    final r = await dio.delete('$baseApiUrl/delete_student', queryParameters: {
      'student_id': student_id
    });
    return r.data?.toString() ?? 'OK';
  }
}