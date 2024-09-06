import 'package:ee_commerce_app/features/authentication/screens/login/login_imports.dart';
import 'package:ee_commerce_app/features/authentication/screens/onboarding/onboarding_imports.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async {
    // Local Storage
    // if(kDebugMode) {
    //   print('================ GET STORAGE AUTH REPO ===============');
    //   print(deviceStorage.read('isFirstTime'));
    // }
    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }
}
