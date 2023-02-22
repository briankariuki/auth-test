import 'package:auth_test/ui/login/login_widget.dart';
import 'package:auth_test/ui/onboarding/onboarding_widget.dart';
import 'package:auth_test/ui/register/register_widget.dart';
import 'package:auth_test/ui/splash/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Routes {
  static String kRegister = "/register";
  static String kLogin = "/login";
  static String kHome = "/home";
  static String kWelcome = "/welcome";
  static String kProfile = "/profile";
  static String kSplash = "/splash";
  static String kOnboarding = "/onboarding";
}

final kRoutes = [
  GetPage(
    name: '${Routes.kWelcome}',
    page: () => Scaffold(),
    children: [],
  ),
  GetPage(
    name: '${Routes.kLogin}',
    page: () => LoginWidget(),
    children: [],
  ),
  GetPage(
    name: '${Routes.kRegister}',
    page: () => RegisterWidget(),
    children: [],
  ),
  GetPage(
    name: '${Routes.kSplash}',
    page: () => SplashWidget(),
    children: [],
  ),
  GetPage(
    name: '${Routes.kOnboarding}',
    page: () => OnboardingWidget(),
    children: [],
  ),
];
