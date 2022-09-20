import 'package:blood_dontaion_app/get/controllers/firebase_controller.dart';
import 'package:blood_dontaion_app/get/controllers/scroll_controller.dart';
import 'package:get/get.dart';

class BloodGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScrollOffsetController());
    
    Get.put(FirebaseController());
  }
}
