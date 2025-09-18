import '../../domain/entities/student.dart';

class StudentModel extends Student {
  const StudentModel({required int? student_id, required String? firstname, required String? lastname,
                      required String? birth_date, required String? gender, required String? iin,
                      required String? living_adress, int? edu_group_id}) : super(
    student_id: student_id, firstname: firstname, lastname: lastname,
    birth_date: birth_date, gender: gender, iin: iin,
    living_adress: living_adress, edu_group_id: edu_group_id
  );

  factory StudentModel.fromJson(Map<String, dynamic> j) {
    return StudentModel(
        student_id: j['student_id'],
        firstname: j['firstname'] as String,
        lastname: j['lastname'] as String,
        birth_date: j['birth_date'] as String,
        gender: j['gender'] as String,
        iin: j['iin'] as String,
        living_adress: j['living_adress'] as String,
        edu_group_id: j['edu_group_id'],
    );
  }

  Map<String, dynamic> toJson() => {
    if (student_id != null) 'student_id': student_id,
    'firstname': firstname,
    'lastname': lastname,
    'birth_date': birth_date,
    'gender': gender,
    'iin': iin,
    'living_adress': living_adress,
    'edu_group_id': edu_group_id,
  };

  factory StudentModel.fromEntity(Student s) {
    return StudentModel(
        student_id: s.student_id,
        firstname: s.firstname,
        lastname: s.lastname,
        birth_date: s.birth_date,
        gender: s.gender,
        iin: s.iin,
        living_adress: s.living_adress,
        edu_group_id: s.edu_group_id
    );
  }
}