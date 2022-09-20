
import 'package:blood_dontaion_app/get/controllers/scroll_controller.dart';
import 'package:get/get.dart';


class ScrollOffsetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScrollOffsetController());
 
  }
}


