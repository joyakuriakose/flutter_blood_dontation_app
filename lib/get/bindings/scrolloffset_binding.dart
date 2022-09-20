
import 'package:get/get.dart';

import '../scroll_controller.dart';

class ScrollOffsetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScrollOffsetController());
 
  }
}


