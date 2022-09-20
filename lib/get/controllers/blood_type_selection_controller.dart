import 'package:get/get.dart';

class BloodTypeSelectionController extends GetxController {
  final List<String> bloodGroups = [
    "All",
    "A+",
    "A-",
    "B+",
    "B-",
    "AB+",
    "AB-",
    "O+",
    "O-"
  ];
  var selectedType = 0.obs;
}
