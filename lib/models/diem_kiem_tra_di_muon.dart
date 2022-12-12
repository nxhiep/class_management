
import 'package:json_annotation/json_annotation.dart';

part 'diem_kiem_tra_di_muon.g.dart';

@JsonSerializable()
class DiemKiemTraDiMuon {
  final String schoolYearId;
  final String classId;
  final String schoolName;

  final int date;
  final List<String> supervisors;
  final int type;

  late int total;
  late int missing;
  late int missingOK;
  late int missingNotOK;
  late String note;

  late String teacherName;
  late String subjectName;

  late String status;

  DiemKiemTraDiMuon({ 
    required this.schoolYearId, 
    required this.classId, 
    required this.schoolName, 
    required this.date, 
    required this.supervisors, 
    required this.type, 
  });

  factory DiemKiemTraDiMuon.fromJson(Map<String, dynamic> json) => _$DiemKiemTraDiMuonFromJson(json);

  Map<String, dynamic> toJson() => _$DiemKiemTraDiMuonToJson(this);
}