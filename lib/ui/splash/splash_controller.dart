import 'package:auth_test/helpers/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var isFetching = false.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 1), () {
      fetch();
    });
  }

  void fetch() async {
    if (isFetching.isTrue) return;

    isFetching.value = true;

    try {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.offAndToNamed('/onboarding');
      } else {
        Get.offAndToNamed('/register');
      }
    } catch (e) {
      Util.showError(e, show: true);
    }
    isFetching.value = false;
  }
}
