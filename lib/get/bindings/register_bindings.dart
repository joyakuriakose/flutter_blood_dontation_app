import 'package:blood_dontaion_app/get/scroll_controller.dart';
import 'package:get/get.dart';
import 'package:blood_dontaion_app/get/register_form_controller.dart';
import 'package:blood_dontaion_app/get/register_page_view_controller.dart';

class RegisterPageBinding extends Bindings{
  @override
  void dependencies() {
       Get.put(RegisterFormController());
    Get.put(RegisterPageViewController());
     Get.put(ScrollOffsetController());
    
  }
}