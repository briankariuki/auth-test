import 'package:auth_test/config/keys.dart';
import 'package:auth_test/helpers/util.dart';
import 'package:auth_test/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;
  final showPassword = false.obs;
  final isEmailValid = false.obs;

  final RxString email = ''.obs;
  final RxString pas1 = ''.obs;
  final RxString pas2 = ''.obs;

  final formKey = GlobalObjectKey<FormState>('register_form');

  var emailCtl = TextEditingController();
  var pas1Ctl = TextEditingController();
  var pas2Ctl = TextEditingController();

  Rx<model.User> appuser = Rx<model.User>(model.User());

  @override
  void onClose() {
    emailCtl.dispose();
    pas1Ctl.dispose();
    pas2Ctl.dispose();
    super.onClose();
  }

  Future<void> register() async {
    if (isLoading.isTrue) return;

    isLoading.value = true;

    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      if (e.toString().toLowerCase().endsWith('wrong credentials')) {
        Util.showError('Incorrect email address or password', show: true);
      } else if (e.toString().toLowerCase().contains('in use by another account.')) {
        Util.showError('Email address already in use. Please login', show: true);
      } else if (e.toString().toLowerCase().contains('weak password')) {
        Util.showError('Weak Password', show: true);
      } else {
        Util.showError(e, show: true);
      }
    }

    isLoading.value = false;
  }
}
