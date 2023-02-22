import 'dart:convert';
import 'package:auth_test/config/env.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@JsonSerializable()
class File {
  late String filename;

  String get url => "${kBaseApiUrl}v1/file/$filename";

  late int? size;

  late String? type;

  late String? mime;

  late String? blurhash;

  late dynamic dimensions;

  int get height => dimensions["height"];
  int get width => dimensions["width"];

  double get aspectRatio => width / height;

  static File fromJson(dynamic json) => _$FileFromJson(json);

  static File fromString(String json) => _$FileFromJson(jsonDecode(json));

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$FileToJson(this);
}
