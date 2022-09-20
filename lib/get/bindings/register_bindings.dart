import 'package:blood_dontaion_app/get/controllers/register_form_controller.dart';
import 'package:blood_dontaion_app/get/controllers/register_page_view_controller.dart';
import 'package:blood_dontaion_app/get/controllers/scroll_controller.dart';
import 'package:get/get.dart';

class RegisterPageBinding extends Bindings{
  @override
  void dependencies() {
       Get.put(RegisterFormController());
    Get.put(RegisterPageViewController());
     Get.put(ScrollOffsetController());
    
  }
}