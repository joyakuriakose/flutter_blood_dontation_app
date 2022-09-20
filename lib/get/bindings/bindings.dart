import 'package:blood_dontaion_app/get/blood_type_selection_controller.dart';
import 'package:blood_dontaion_app/get/scroll_controller.dart';
import 'package:get/get.dart';

class BloodGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScrollOffsetController());
    Get.put(BloodTypeSelectionController());
  }
}
