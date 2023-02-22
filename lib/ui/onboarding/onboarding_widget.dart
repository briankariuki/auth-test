import 'package:auth_test/assets.dart';
import 'package:auth_test/config/palette.dart';
import 'package:auth_test/ui/onboarding/onboarding_controller.dart';
import 'package:auth_test/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController(), tag: 'onboarding');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        actions: [
          CustomTextButton(
            onTap: () => controller.logout(),
            title: "Log out",
            height: 48.0,
            minWidth: 48.0,
            textColor: Palette.primary,
          ),
          const SizedBox(
            width: 24.0,
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isFetching.isTrue
              ? Center()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DividerWidget(
                      color: Colors.black.withOpacity(0.16),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          // Container(
                          //   child: controller.user.value.profileWidget(radius: 24.0),
                          // )

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HeadlineMedium(
                                  title: "Welcome to Your\nAccount",
                                  color: Palette.primary,
                                  lineHeight: 1.2,
                                  fontWeight: FontWeight.w700,
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                BodyMedium(
                                  title: "View your profile details",
                                  color: Palette.gray2,
                                )
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 16.0,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => controller.pickUploadImage(),
                                  child: Row(
                                    children: [
                                      Obx(
                                        () {
                                          final file = controller.file.value;

                                          return CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 42.0,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(50.0),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 78.0,
                                                    width: 78.0,
                                                    color: Colors.black.withOpacity(0.6),
                                                    child: file == null
                                                        ? IgnorePointer(child: controller.user.value.profileWidget(radius: 40.0))
                                                        : Image.file(
                                                            file,
                                                            width: 88,
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                                  Positioned.fill(
                                                    child: GestureDetector(
                                                      onTap: () => controller.pickUploadImage(),
                                                      child: Container(
                                                        height: 78.0,
                                                        width: 78.0,
                                                        color: Colors.black.withOpacity(0.4),
                                                        child: Icon(
                                                          Icons.camera_alt_outlined,
                                                          size: 28.0,
                                                          color: Palette.gray8,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        width: 16.0,
                                      ),
                                      BodyLarge(
                                        title: 'Tap to change profile picture',
                                        color: Palette.gray2,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                BodyLarge(
                                  title: 'Name',
                                  color: Palette.gray2,
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 48.0,
                                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                        decoration: BoxDecoration(
                                          color: Palette.gray5,
                                        ),
                                        child: Obx(
                                          () => BodySmall(
                                            title: controller.user.value.displayName ?? 'My Display Name',
                                            color: Palette.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    CustomIconButton(
                                      onTap: () => controller.changeName(),
                                      icon: IconAsset(
                                        name: Assets.edit,
                                        height: 24.0,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                BodyLarge(
                                  title: 'Email Address',
                                  color: Palette.gray2,
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 48.0,
                                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                        decoration: BoxDecoration(
                                          color: Palette.gray5,
                                        ),
                                        child: BodySmall(
                                          title: controller.user.value.email ?? 'My Email',
                                          color: Palette.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          Container(
                            child: BodyMedium(title: "", color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
