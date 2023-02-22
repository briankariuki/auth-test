import 'package:auth_test/ui/splash/splash_controller.dart';
import 'package:auth_test/widgets/custom_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController(), tag: 'splash');
    return Scaffold(
      body: Obx(
        () => controller.isFetching.isTrue
            ? Center(
                child: CustomLoader(
                  color: Colors.black,
                  height: 24.0,
                ),
              )
            : Container(),
      ),
    );
  }
}
