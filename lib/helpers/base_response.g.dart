// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..token = json['token'] as String?
  ..file = json['file'] == null
      ? null
      : File.fromJson(json['file'] as Map<String, dynamic>)
  ..error = json['error'] == null
      ? null
      : Error.fromJson(json['error'] as Map<String, dynamic>)
  ..user = json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'file': instance.file,
      'error': instance.error,
      'user': instance.user,
    };
