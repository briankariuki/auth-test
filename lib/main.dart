import 'package:auth_test/config/routes.dart';
import 'package:auth_test/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      // defaultTransition: Transition.rightToLeftWithFade,
      debugShowCheckedModeBanner: false,
      title: 'Auth test',
      themeMode: ThemeMode.system,
      initialRoute: '/splash',
      getPages: kRoutes,
    ),
  );
}
