import 'package:json_annotation/json_annotation.dart';

abstract class BaseObject {
  @JsonKey(name: '_id')
  late String? iid;

  @JsonKey(name: '_status')
  late String? baseStatus;

  @JsonKey(name: 'created_at')
  late DateTime? createdAt;

  @JsonKey(name: 'createdAt')
  late DateTime? baseCreatedAt;

  @JsonKey(name: 'updated_at')
  late DateTime? updatedAt;

  @JsonKey(name: 'updatedAt')
  late DateTime? baseUpdatedAt;
}
