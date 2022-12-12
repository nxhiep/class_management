// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diem_kiem_tra_dot_xuat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiemKiemTraDotXuat _$DiemKiemTraDotXuatFromJson(Map<String, dynamic> json) =>
    DiemKiemTraDotXuat(
      schoolYearId: json['schoolYearId'] as String,
      classId: json['classId'] as String,
      schoolName: json['schoolName'] as String,
      date: json['date'] as int,
      supervisors: (json['supervisors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      numberOfMonth: json['numberOfMonth'] as int,
    )
      ..status = json['status'] as String
      ..costumeAndBadges = (json['costumeAndBadges'] as num).toDouble()
      ..hygieneAndFacilities = (json['hygieneAndFacilities'] as num).toDouble()
      ..learningAttitude = (json['learningAttitude'] as num).toDouble()
      ..groupActivities = (json['groupActivities'] as num).toDouble()
      ..note = json['note'] as String;

Map<String, dynamic> _$DiemKiemTraDotXuatToJson(DiemKiemTraDotXuat instance) =>
    <String, dynamic>{
      'schoolYearId': instance.schoolYearId,
      'classId': instance.classId,
      'schoolName': instance.schoolName,
      'date': instance.date,
      'supervisors': instance.supervisors,
      'numberOfMonth': instance.numberOfMonth,
      'status': instance.status,
      'costumeAndBadges': instance.costumeAndBadges,
      'hygieneAndFacilities': instance.hygieneAndFacilities,
      'learningAttitude': instance.learningAttitude,
      'groupActivities': instance.groupActivities,
      'note': instance.note,
    };
