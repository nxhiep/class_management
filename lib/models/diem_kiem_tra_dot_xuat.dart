
import 'package:json_annotation/json_annotation.dart';
part 'diem_kiem_tra_dot_xuat.g.dart';

@JsonSerializable()
class DiemKiemTraDotXuat {
  final String schoolYearId;
  final String classId;
  final String schoolName;

  final int date;
  final List<String> supervisors;
  final int numberOfMonth;

  late String status;
  late double costumeAndBadges;
  late double hygieneAndFacilities;
  late double learningAttitude;
  late double groupActivities;
  late String note;

  DiemKiemTraDotXuat({ 
    required this.schoolYearId, 
    required this.classId, 
    required this.schoolName, 
    required this.date, 
    required this.supervisors, 
    required this.numberOfMonth, 
  });

  factory DiemKiemTraDotXuat.fromJson(Map<String, dynamic> json) => _$DiemKiemTraDotXuatFromJson(json);

  Map<String, dynamic> toJson() => _$DiemKiemTraDotXuatToJson(this);
}