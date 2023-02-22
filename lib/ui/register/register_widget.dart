import 'package:auth_test/assets.dart';
import 'package:auth_test/config/keys.dart';
import 'package:auth_test/config/palette.dart';
import 'package:auth_test/ui/register/register_controller.dart';
import 'package:auth_test/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put<RegisterController>(RegisterController(), tag: 'register');
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadlineMedium(
                          title: "Create Your\nAccount",
                          color: Palette.primary,
                          lineHeight: 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        BodyMedium(
                          title: "Add your email and password",
                          color: Palette.gray2,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BodyLarge(
                            title: 'Email',
                            color: Palette.gray2,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Obx(
                            () => CustomTextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              maxLines: 1,
                              controller: controller.emailCtl,
                              autofillHints: [AutofillHints.email],
                              onChanged: (value) {
                                controller.email.value = value;

                                if (emailRegExp.hasMatch(value)) {
                                  controller.isEmailValid.value = true;
                                } else {
                                  controller.isEmailValid.value = false;
                                }
                              },
                              hintText: 'Email Address',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter email';
                                } else if (!emailRegExp.hasMatch(value)) {
                                  return 'Invalid email';
                                } else {
                                  controller.isEmailValid.value = true;
                                  return null;
                                }
                              },
                              suffixIcon: (controller.isEmailValid.isTrue)
                                  ? UnconstrainedBox(
                                      child: IconAsset(
                                        name: Assets.tickSolid,
                                        color: Colors.black,
                                        height: 24.0,
                                        width: 24.0,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          BodyLarge(
                            title: 'Password',
                            color: Palette.gray2,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Obx(
                            () => CustomTextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              maxLines: 1,
                              controller: controller.pas1Ctl,
                              autofillHints: [AutofillHints.password],
                              onChanged: (value) {
                                controller.pas1.value = value;
                              },
                              hintText: 'Enter Password',
                              validator: (value) {
                                if (value!.length < 8) {
                                  return 'Enter atleast 8 Characters';
                                } else {
                                  return null;
                                }
                              },
                              obsecureText: !controller.showPassword.value,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.showPassword.toggle();
                                },
                                icon: IconAsset(
                                  name: controller.showPassword.isTrue ? Assets.eye : Assets.eyeOff,
                                  color: controller.showPassword.isTrue ? Palette.black : Palette.gray4,
                                  height: 16.0,
                                  width: 16.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          BodyLarge(
                            title: 'Confirm Password',
                            color: Palette.gray2,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Obx(
                            () => CustomTextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              maxLines: 1,
                              controller: controller.pas2Ctl,
                              autofillHints: [AutofillHints.password],
                              onChanged: (value) {
                                controller.pas1.value = value;
                              },
                              hintText: 'Confirm Password',
                              validator: (value) {
                                if (value != controller.pas1.value) {
                                  return 'Passwords do not match';
                                } else {
                                  return null;
                                }
                              },
                              obsecureText: !controller.showPassword.value,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.showPassword.toggle();
                                },
                                icon: IconAsset(
                                  name: controller.showPassword.isTrue ? Assets.eye : Assets.eyeOff,
                                  color: controller.showPassword.isTrue ? Palette.black : Palette.gray4,
                                  height: 16.0,
                                  width: 16.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () => Get.offAndToNamed('/login'),
                              child: BodyMedium(
                                title: "Have an account? Sign In",
                                color: Palette.gray2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            DividerWidget(
              color: Colors.black.withOpacity(0.16),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Obx(
                () => CustomButton(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      if (controller.isEmailValid.isTrue) {
                        controller.register();
                      }
                    }
                  },
                  title: "Register",
                  height: 48.0,
                  minWidth: 64.0,
                  color: Palette.black,
                  textColor: Colors.white,
                  isLoading: controller.isLoading.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
