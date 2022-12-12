
import 'package:json_annotation/json_annotation.dart';

part 'diem_kiem_tra_ne_nep.g.dart';

@JsonSerializable()
class DiemKiemTraNeNep {
  final String schoolYearId;
  final String schoolName;
  final String classId;

  final int date;
  final int minusPoint;
  final String studentsName;

  final String content;
  final String note;

  DiemKiemTraNeNep({ 
    required this.schoolYearId, 
    required this.schoolName, 
    required this.classId, 
    required this.date, 
    required this.minusPoint, 
    required this.studentsName,
    required this.content,
    required this.note,
  });

  factory DiemKiemTraNeNep.fromJson(Map<String, dynamic> json) => _$DiemKiemTraNeNepFromJson(json);

  Map<String, dynamic> toJson() => _$DiemKiemTraNeNepToJson(this);
}