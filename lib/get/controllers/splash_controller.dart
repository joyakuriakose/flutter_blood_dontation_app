import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    initSplash();
    super.onReady();
  }

  void initSplash()async {
   await Future.delayed(const Duration(seconds: 2));
    navigateToIntroduction();
  }

  void navigateToIntroduction() {
    Get.offAllNamed('home');
  }
}