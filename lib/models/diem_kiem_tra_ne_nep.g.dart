// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diem_kiem_tra_ne_nep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiemKiemTraNeNep _$DiemKiemTraNeNepFromJson(Map<String, dynamic> json) =>
    DiemKiemTraNeNep(
      schoolYearId: json['schoolYearId'] as String,
      schoolName: json['schoolName'] as String,
      classId: json['classId'] as String,
      date: json['date'] as int,
      minusPoint: json['minusPoint'] as int,
      studentsName: json['studentsName'] as String,
      content: json['content'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$DiemKiemTraNeNepToJson(DiemKiemTraNeNep instance) =>
    <String, dynamic>{
      'schoolYearId': instance.schoolYearId,
      'schoolName': instance.schoolName,
      'classId': instance.classId,
      'date': instance.date,
      'minusPoint': instance.minusPoint,
      'studentsName': instance.studentsName,
      'content': instance.content,
      'note': instance.note,
    };
