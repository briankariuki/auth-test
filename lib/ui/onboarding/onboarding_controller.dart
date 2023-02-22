import 'dart:convert';
import 'dart:io';

import 'package:auth_test/config/env.dart';
import 'package:auth_test/config/keys.dart';
import 'package:auth_test/config/palette.dart';
import 'package:auth_test/helpers/util.dart';
import 'package:auth_test/models/models.dart' as models;
import 'package:auth_test/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cloudinary/cloudinary.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  final isSelecting = false.obs;
  final isUpdating = false.obs;
  final isFetching = false.obs;
  final isLoggingOut = false.obs;
  final isUploading = false.obs;
  final isChangingName = false.obs;

  final cloudinary = Cloudinary.signedConfig(
    apiKey: kCloudinaryKey!,
    apiSecret: kCloudinarySecret!,
    cloudName: kCloudinaryCloudName!,
  );

  Rx<File?> file = Rx(null);

  final _imagePicker = ImagePicker();

  Rx<models.User> user = Rx<models.User>(models.User());

  final nameCtl = TextEditingController();

  RxString name = RxString('');

  pickImage() async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 60,
      );

      if (image != null) {
        // ignore: no_leading_underscores_for_local_identifiers
        final croppedFile = await Util.cropImage(image, 1.0, 1.0, true);

        file.value = croppedFile;
      }
    } catch (e) {
      if (kDebugMode) print(e);
      Util.showError(e, show: true);
    }
  }

  @override
  void onInit() {
    super.onInit();

    fetch();
  }

  @override
  onClose() {
    nameCtl.dispose();
    super.onClose();
  }

  Future<void> fetch() async {
    if (isFetching.isTrue) return;

    isFetching.value = true;

    try {
      var prefs = await SharedPreferences.getInstance();

      final savedUser = prefs.get(kUser);

      if (savedUser == null) {
      } else {
        user.value = models.User.fromJson(jsonDecode(savedUser as String));

        name.value = user.value.displayName ?? '';
        nameCtl.text = name.value;
      }
    } catch (e) {
      Util.showError(e);
    }

    isFetching.value = false;
  }

  Future<void> onboard() async {
    if (isUpdating.isTrue) return;

    isUpdating.value = true;

    try {} catch (e) {
      Util.showError(e);
    }

    isUpdating.value = false;
  }

  Future<void> pickUploadImage() async {
    if (isSelecting.isTrue) return;

    isSelecting.value = true;

    try {
      pickImage();

      Get.bottomSheet(
        Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: TitleSmall(title: "Upload Image", color: Colors.black),
                ),
                DividerWidget(
                  color: Colors.black.withOpacity(0.16),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () {
                          final file1 = file.value;

                          return CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200.0),
                              child: Container(
                                height: 178.0,
                                width: 178.0,
                                color: Colors.black.withOpacity(0.6),
                                child: file1 == null
                                    // ? IgnorePointer(child: user.value.profileWidget(radius: 40.0))
                                    ? IgnorePointer(child: Container())
                                    : Image.file(
                                        file1,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                DividerWidget(
                  color: Colors.black.withOpacity(0.16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            file.value = null;

                            file.refresh();
                            Get.back();
                          },
                          title: "Cancel",
                          height: 48.0,
                          minWidth: 64.0,
                          textColor: Palette.black,
                          color: Palette.gray7,
                          isLoading: false,
                        ),
                      ),
                      const SizedBox(
                        width: 24.0,
                      ),
                      Expanded(
                        child: Obx(() => CustomButton(
                              onTap: () => uploadFile(),
                              title: "Upload Picture",
                              height: 48.0,
                              minWidth: 64.0,
                              color: Palette.black,
                              textColor: Colors.white,
                              isLoading: isUploading.value,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      Util.showError(e);
    }

    isSelecting.value = false;
  }

  Future<void> changeName() async {
    if (isChangingName.isTrue) return;

    isChangingName.value = true;

    try {
      Get.bottomSheet(
        Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  child: TitleSmall(title: "Change Name", color: Colors.black),
                ),
                DividerWidget(
                  color: Colors.black.withOpacity(0.16),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyLarge(
                          title: 'Enter your display name',
                          color: Palette.gray2,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        CustomTextField(
                          maxLines: 1,
                          controller: nameCtl,
                          autofillHints: [AutofillHints.email],
                          onChanged: (value) {
                            name.value = value;
                          },
                          hintText: 'Display Name',
                        ),
                      ],
                    ),
                  ),
                ),
                DividerWidget(
                  color: Colors.black.withOpacity(0.16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            Get.back();
                          },
                          title: "Cancel",
                          height: 48.0,
                          minWidth: 64.0,
                          textColor: Palette.black,
                          color: Palette.gray7,
                          isLoading: false,
                        ),
                      ),
                      const SizedBox(
                        width: 24.0,
                      ),
                      Expanded(
                        child: CustomButton(
                          onTap: () async {
                            if (name.isNotEmpty) {
                              user.value.displayName = name.trim();

                              user.refresh();

                              var prefs = await SharedPreferences.getInstance();

                              await prefs.setString(kUser, user.value.toString());
                            }

                            Get.back();

                            Util.toast('Name change success');
                          },
                          title: "Change Name",
                          height: 48.0,
                          minWidth: 64.0,
                          color: Palette.black,
                          textColor: Colors.white,
                          isLoading: false,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      Util.showError(e);
    }

    isChangingName.value = false;
  }

  Future<void> logout() async {
    if (isLoggingOut.isTrue) return;

    isLoggingOut.value = true;
    try {
      await FirebaseAuth.instance.signOut();

      var prefs = await SharedPreferences.getInstance();

      await prefs.clear();

      Get.offAndToNamed('/login');
    } catch (e) {
      Util.showError(e);
    }

    isLoggingOut.value = false;
  }

  Future<void> uploadFile() async {
    if (file.value == null) return;
    if (isUploading.isTrue) return;

    isUploading.value = true;
    try {
      final response = await cloudinary.upload(
          file: file.value!.path,
          fileBytes: file.value!.readAsBytesSync(),
          resourceType: CloudinaryResourceType.image,
          folder: 'profileimage',
          fileName: (DateTime.now().millisecondsSinceEpoch / 1000).toString(),
          progressCallback: (count, total) {
            print('Uploading image from file with progress: $count/$total');
          });

      if (response.isSuccessful) {
        user.value.profileUrl = response.secureUrl;

        user.refresh();

        var prefs = await SharedPreferences.getInstance();

        await prefs.setString(kUser, user.value.toString());
      }

      Get.back();

      Util.toast('Profile picture updated successfully');
    } catch (e) {
      Util.showError(e);
    }

    isUploading.value = false;
  }
}
