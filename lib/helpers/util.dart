import 'dart:io';

import 'package:auth_test/config/palette.dart';
import 'package:auth_test/helpers/base_response.dart';
import 'package:auth_test/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Util {
  static Future<void> showError(dynamic error, {bool show = false}) async {
    var result = await errorHandler(error);

    if (show) {
      var message = result[0];
      if (message.contains('NoSuchMethodError') ||
          message.contains('is not a subtype of') ||
          message.contains('500: Internal Server Error') ||
          message.contains('Null check operator') ||
          message.contains('FormatException') ||
          message.contains('not found. You need to call') ||
          message.contains('LateInitializationError') ||
          message.contains('PlatformException') ||
          message.contains('validation failed') ||
          message.contains('Dio') ||
          message.contains('firebase') ||
          message.contains('connect') ||
          message.contains('Illegal argument in isolate') ||
          message.contains('firebase_auth/too-many-requests')) {
        message = 'An error occured. Try again';
      }

      if (message.contains('Connection failed')) {
        message = 'Connection failed. Try again';
      }

      toast(message);
    }
  }

  static Future<void> toast(
    String message, {
    Widget? body,
    Widget? icon,
    Widget? trailing,
    Function(dynamic)? onTap,
  }) async {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Palette.primary,
      titleText: const SizedBox.shrink(),
      margin: const EdgeInsets.all(12.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      messageText: BodyLarge(
        title: message,
        color: Colors.white,
        lineHeight: 1.0,
        fontWeight: FontWeight.w600,
      ),
      borderRadius: 2.0,
      // icon: IconAsset(
      //   name: Assets.slash,
      //   height: 24.0,
      //   color: Colors.white,
      // ),
      shouldIconPulse: true,
      snackPosition: SnackPosition.TOP,
      forwardAnimationCurve: Curves.easeInSine,
      reverseAnimationCurve: Palette.easeCurve,
    );
  }

  static Future<File?> cropImage(
    XFile file,
    double ratioX,
    double ratioY,
    bool cropCircle,
  ) async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: ratioX, ratioY: ratioY),
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.original,
        ],
        cropStyle: cropCircle == true ? CropStyle.circle : CropStyle.rectangle,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.transparent,
          toolbarWidgetColor: Palette.primary,
          backgroundColor: Colors.black,
          activeControlsWidgetColor: Palette.primary,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
        ),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
          title: 'Crop Image',
        ));

    if (croppedFile != null) {
      return croppedFile;
    }

    return null;
  }
}

Future<List> errorHandler(e) async {
  String message = 'An error occured. Try again';

  bool isAppError = true;

  if (kDebugMode) print(e);

  if (e is DioError) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        message = 'Connection timeout. Try again';

        break;
      case DioErrorType.sendTimeout:
        message = 'Request took too long. Try again';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Response took too long. Try again';
        break;
      case DioErrorType.response:
        if (e.response?.data is BaseResponse) {
          message = '${(e.response?.data as BaseResponse).error?.message}';
        } else {
          message = 'Response error. Try again';
        }
        break;
      case DioErrorType.cancel:
        message = 'Request cancelled. Try again';
        break;
      case DioErrorType.other:
        message = 'An error occured. Try again';

        if (e.toString().contains('Network is unreachable') || e.toString().contains('Connection refused') || e.toString().contains('Http status error')) {
          message = 'Connection failed';
        }
        break;
    }

    isAppError = false;
  } else {
    message = e.toString();
  }

  return [message, isAppError];
}
