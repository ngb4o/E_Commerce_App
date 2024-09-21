import 'package:ee_commerce_app/data/repositories/user/user_repository.dart';
import 'package:ee_commerce_app/features/personalization/controller/user_controller.dart';
import 'package:ee_commerce_app/features/personalization/screens/profile/profile_imports.dart';
import 'package:ee_commerce_app/generated/assets.dart';
import 'package:ee_commerce_app/utils/helpers/network_manager.dart';
import 'package:ee_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:ee_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // Init user data when home screen appear
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start loader
      TFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
        Assets.animations141594AnimationOfDocer,
      );

      // Check Internet Connectivity
      final isConnect = await NetworkManager.instance.isConnected();
      if (!isConnect) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validator
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first name & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(title: 'Congratulation', message: 'Your name has been update');

      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
