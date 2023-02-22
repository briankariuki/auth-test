import 'dart:convert';
import 'package:auth_test/config/env.dart';
import 'package:auth_test/helpers/base_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dio_adapter_stub.dart' if (dart.library.io) 'dio_adapter_mobile.dart' if (dart.library.js) 'dio_adapter_web.dart';

_parseAndDecode(String response) {
  return BaseResponse.fromJson(jsonDecode(response));
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class BaseDio with DioMixin implements Dio {
  BaseDio() {
    if (kIsWeb) {
      httpClientAdapter = getAdapter();
    } else {
      httpClientAdapter = getAdapter();
    }

    transformer = DefaultTransformer(jsonDecodeCallback: parseJson);

    if (!kReleaseMode) interceptors.add(LogInterceptor(requestBody: kDebugMode ? true : false, responseBody: true, request: false, requestHeader: false));

    // interceptors.add(
    //   PrettyDioLogger(
    //     requestHeader: kDebugMode ? true : false,
    //     requestBody: kDebugMode ? true : false,
    //     responseBody: kDebugMode ? true : false,
    //     responseHeader: false,
    //     error: kDebugMode ? true : false,
    //     compact: true,
    //     maxWidth: 90,
    //   ),
    // );

    interceptors.add(QueuedInterceptorsWrapper(onRequest: (options, handler) async {
      try {
        String token = FirebaseAuth.instance.currentUser == null ? '' : await FirebaseAuth.instance.currentUser!.getIdToken(true);

        if (token != "") options.headers['authorization'] = 'Bearer $token';

        //options.headers['authorization'] = 'Bearer $token';
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }

      // try {
      //   String? token = await FirebaseMessaging.instance.getToken();

      //   if (token != null) {
      //     options.headers['app-token'] = token;
      //   }
      // } catch (e) {
      //   if (kDebugMode) {
      //     print(e);
      //   }
      // }

      try {
        var packageInfo = await PackageInfo.fromPlatform();

        var prefs = await SharedPreferences.getInstance();

        // var _fcmToken = prefs.getString(kFcmToken);

        // var _appAuthToken = Util.generateJWT(
        //   {
        //     'token': kAppSecret,
        //     'date': DateTime.now().toIso8601String(),
        //   },
        //   kJWTSecret!,
        // );

        // options.headers['app-device-name'] = appService.deviceInfo.value.name ?? '';
        // options.headers['app-device-os'] = appService.deviceInfo.value.os ?? '';
        // options.headers['app-device-os-version'] = appService.deviceInfo.value.version ?? '';
        // options.headers['app-device-id'] = appService.deviceInfo.value.id ?? '';
        // options.headers['app-device-type'] = appService.deviceInfo.value.type ?? '';
        options.headers['app-id'] = kAppBuildVersion!;
        options.headers['app-name'] = packageInfo.appName;
        options.headers['app-package-name'] = packageInfo.packageName;
        options.headers['app-version'] = packageInfo.version;
        options.headers['app-build-number'] = packageInfo.buildNumber;
        // options.headers['app-token'] = _fcmToken ?? '';
        // options.headers['app-authorization'] = 'Bearer $_appAuthToken';
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }

      handler.next(options);
    }, onResponse: (response, handler) {
      handler.next(response);
    }, onError: (error, handler) async {
      // if (error.response?.statusCode == 401) await appService.logout(onboard: true, logoutAnon: false);

      handler.next(error);
    }));
  }

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: kBaseApiUrl!,
        followRedirects: false,
        receiveTimeout: 60000,
        connectTimeout: 15000,
        contentType: Headers.jsonContentType,
      );
}
