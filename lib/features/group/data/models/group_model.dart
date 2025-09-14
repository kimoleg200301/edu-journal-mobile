import '../../domain/entities/group.dart';

class GroupModel extends Group {
  const GroupModel({int? edu_group_id, required String name, String? created})
    : super(edu_group_id: edu_group_id, name: name, created: created);

  factory GroupModel.fromJson(Map<String, dynamic> j) {
    return GroupModel(
      edu_group_id: j['edu_group_id'],
      name: j['name'] as String,
      created: j['created'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    if (edu_group_id != null) 'edu_group_id': edu_group_id,
    'name': name,
    if (created != null) 'created': created,
  };
}