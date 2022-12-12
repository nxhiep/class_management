// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diem_kiem_tra_di_muon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiemKiemTraDiMuon _$DiemKiemTraDiMuonFromJson(Map<String, dynamic> json) =>
    DiemKiemTraDiMuon(
      schoolYearId: json['schoolYearId'] as String,
      classId: json['classId'] as String,
      schoolName: json['schoolName'] as String,
      date: json['date'] as int,
      supervisors: (json['supervisors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      type: json['type'] as int,
    )
      ..total = json['total'] as int
      ..missing = json['missing'] as int
      ..missingOK = json['missingOK'] as int
      ..missingNotOK = json['missingNotOK'] as int
      ..note = json['note'] as String
      ..teacherName = json['teacherName'] as String
      ..subjectName = json['subjectName'] as String
      ..status = json['status'] as String;

Map<String, dynamic> _$DiemKiemTraDiMuonToJson(DiemKiemTraDiMuon instance) =>
    <String, dynamic>{
      'schoolYearId': instance.schoolYearId,
      'classId': instance.classId,
      'schoolName': instance.schoolName,
      'date': instance.date,
      'supervisors': instance.supervisors,
      'type': instance.type,
      'total': instance.total,
      'missing': instance.missing,
      'missingOK': instance.missingOK,
      'missingNotOK': instance.missingNotOK,
      'note': instance.note,
      'teacherName': instance.teacherName,
      'subjectName': instance.subjectName,
      'status': instance.status,
    };
