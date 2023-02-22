// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

File _$FileFromJson(Map<String, dynamic> json) => File()
  ..filename = json['filename'] as String
  ..size = json['size'] as int?
  ..type = json['type'] as String?
  ..mime = json['mime'] as String?
  ..blurhash = json['blurhash'] as String?
  ..dimensions = json['dimensions'];

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'filename': instance.filename,
      'size': instance.size,
      'type': instance.type,
      'mime': instance.mime,
      'blurhash': instance.blurhash,
      'dimensions': instance.dimensions,
    };
