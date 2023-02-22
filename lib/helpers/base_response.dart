import 'dart:convert';

import 'package:auth_test/models/file.dart';
import 'package:auth_test/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  late String? token;

  late File? file;

  late Error? error;

  late User? user;

  static BaseResponse fromJson(dynamic json) => _$BaseResponseFromJson(json);

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
