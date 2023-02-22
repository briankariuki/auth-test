import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter/foundation.dart';

String? kBaseApiUrl = kReleaseMode ? dotenv.env['BASE_API_URL'] : dotenv.env['BASE_API_URL_2'];
String? kAppName = dotenv.env['APP_NAME'];
String? kAppVersion = dotenv.env['APP_VERSION'];
String? kAppPackageName = dotenv.env['APP_PACKAGE_NAME'];
String? kAppBuildVersion = dotenv.env['APP_BUILD_VERSION'];
String? kCloudinaryKey = dotenv.env['CLOUDINARY_KEY'];
String? kCloudinarySecret = dotenv.env['CLOUDINARY_SECRET'];
String? kCloudinaryCloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'];
