import 'package:ee_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ee_commerce_app/features/personalization/controller/user_controller.dart';
import 'package:ee_commerce_app/utils/helpers/network_manager.dart';
import 'package:ee_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:ee_commerce_app/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../generated/assets.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Email & Password Sign In
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Loading you in...', Assets.animations141594AnimationOfDocer);

      // Check Internet Connectivity
      final isConnect = await NetworkManager.instance.isConnected();
      if (!isConnect) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validator
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Fetch user data after login
      await userController.fetchUserRecord();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Google Sign In Authentication
  Future<void> signInWithGoogle() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Loading you in...', Assets.animations141594AnimationOfDocer);

      // Check Internet Connectivity
      final isConnect = await NetworkManager.instance.isConnected();
      if (!isConnect) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // Fetch user data after login
      await userController.fetchUserRecord();

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
