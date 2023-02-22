import 'package:auth_test/config/keys.dart';
import 'package:auth_test/helpers/util.dart';
import 'package:auth_test/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;
  final showPassword = false.obs;
  final isEmailValid = false.obs;

  final RxString email = ''.obs;
  final RxString pas1 = ''.obs;

  final formKey = GlobalObjectKey<FormState>('login_form');

  var emailCtl = TextEditingController();
  var pas1Ctl = TextEditingController();

  Rx<model.User> appuser = Rx<model.User>(model.User());

  @override
  void onClose() {
    emailCtl.dispose();
    pas1Ctl.dispose();

    super.onClose();
  }

  Future<void> login() async {
    if (isLoading.isTrue) return;

    isLoading.value = true;

    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: pas1.trim(),
      );

      var prefs = await SharedPreferences.getInstance();

      appuser.value = model.User()
        ..email = email.trim()
        ..displayName = null
        ..photoURL = null
        ..iid = ""
        ..uid = user.user?.uid
        ..baseStatus = "active"
        ..baseCreatedAt = DateTime.now()
        ..baseUpdatedAt = DateTime.now()
        ..createdAt = null
        ..updatedAt = null
        ..profileUrl = null;

      await prefs.setString(kUser, appuser.value.toString());

      Get.offAndToNamed('/onboarding');
    } catch (e) {
      print(e);

      if (e.toString().toLowerCase().endsWith('wrong credentials')) {
        Util.showError('Incorrect email address or password', show: true);
      } else if (e.toString().toLowerCase().contains('wrong-password')) {
        Util.showError('Wrong Password', show: true);
      } else if (e.toString().toLowerCase().contains('user-not-found')) {
        Util.showError('User not found. Please register again', show: true);
      } else if (e.toString().toLowerCase().endsWith('user not found')) {
        Get.offAllNamed('/onboarding');

        return;
      } else {
        Util.showError(e, show: true);

        await FirebaseAuth.instance.signOut();
      }
    }

    isLoading.value = false;
  }
}
