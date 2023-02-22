// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..iid = json['_id'] as String?
  ..baseStatus = json['_status'] as String?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..baseCreatedAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..updatedAt = json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String)
  ..baseUpdatedAt = json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String)
  ..email = json['email'] as String?
  ..displayName = json['displayName'] as String?
  ..photoURL = json['photoURL'] as String?
  ..uid = json['uid'] as String?
  ..profileUrl = json['profileUrl'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.iid,
      '_status': instance.baseStatus,
      'created_at': instance.createdAt?.toIso8601String(),
      'createdAt': instance.baseCreatedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'updatedAt': instance.baseUpdatedAt?.toIso8601String(),
      'email': instance.email,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'uid': instance.uid,
      'profileUrl': instance.profileUrl,
    };
