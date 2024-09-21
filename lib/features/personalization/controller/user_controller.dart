import 'package:ee_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ee_commerce_app/data/repositories/user/user_repository.dart';
import 'package:ee_commerce_app/features/authentication/screens/login/login_imports.dart';
import 'package:ee_commerce_app/features/personalization/models/user_model.dart';
import 'package:ee_commerce_app/features/personalization/screens/profile/remove_account/remove_account_imports.dart';
import 'package:ee_commerce_app/generated/assets.dart';
import 'package:ee_commerce_app/utils/helpers/network_manager.dart';
import 'package:ee_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:ee_commerce_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert name to first and last name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Map data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile',
      );
    }
  }

  // Delete user account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', Assets.animations141594AnimationOfDocer);
      // First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify auth email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();

          // Stop loading
          TFullScreenLoader.stopLoading();

          // Show message success
          TLoaders.successSnackBar(
              title: 'Account Deleted',
              message:
                  'Your account has been successfully deleted. '
                      'We\'re sad to see you go, but we wish you all the best in your future endeavors.',
              duration: 5,
          );

          // Redirect
          Get.offAll(() => const LoginScreen());

        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const RemoveAccountScreen());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', Assets.animations141594AnimationOfDocer);

      // Check Internet Connectivity
      final isConnect = await NetworkManager.instance.isConnected();
      if (!isConnect) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validator
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      // Stop loading
      TFullScreenLoader.stopLoading();

      // Show message success
      TLoaders.successSnackBar(
          title: 'Account Deleted',
          message:
          'Your account has been successfully deleted. '
              'We\'re sad to see you go, but we wish you all the best in your future endeavors.',
        duration: 5,
      );

      // Redirect
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
