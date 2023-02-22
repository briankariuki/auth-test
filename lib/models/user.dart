import 'dart:convert';

import 'package:auth_test/assets.dart';
import 'package:auth_test/config/palette.dart';
import 'package:auth_test/helpers/base_object.dart';

import 'package:auth_test/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseObject {
  late String? email;
  late String? displayName;
  late String? photoURL;

  late String? uid;
  late String? profileUrl;

  bool get self {
    // AppService appService = Get.find(tag: 'app_service');

    // bool _result = (iid!.toString() == appService.user.value.iid!.toString());

    return true;
  }

  static User fromJson(dynamic json) => _$UserFromJson(json);

  static User fromString(String json) => _$UserFromJson(jsonDecode(json));

  Widget profileWidget({double? radius}) => Stack(
        children: [
          profileUrl == null
              ? CircleAvatar(
                  radius: radius,
                  backgroundColor: Palette.gray2,
                  child: IconAsset(
                    name: Assets.userBold,
                    color: Palette.gray3,
                    width: radius!,
                    height: radius,
                  ),
                )
              : CircleAvatar(
                  radius: radius,
                  onBackgroundImageError: (data, _) => {},
                  backgroundImage: CachedNetworkImageProvider(profileUrl!),
                ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius!),
              child: Material(
                color: Colors.transparent,
                child: InkWell(splashColor: Colors.white.withOpacity(0.08), highlightColor: Colors.white.withOpacity(0.03), onTap: () => {}),
              ),
            ),
          ),
        ],
      );

  @override
  String toString() => jsonEncode(toJson());

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
