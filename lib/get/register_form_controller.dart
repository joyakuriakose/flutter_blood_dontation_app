import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterFormController extends GetxController {
  var dobController = TextEditingController(text: "").obs;
  var dobInDateTimeController = DateTime.now().obs;

  List<String> bloodGroups = ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"];
  RxInt selectedBloodGroup = 0.obs;

  List<String> professions = ["Working", "Student", "Other"];
  var selectedProfession = 0.obs;

  List<String> abroadOptions = ["Motherland", "Abroad"];
  var selectedAbroadOption = 0.obs;
  var showAbroadOption = true.obs;
  var isWillingToDonateBlood = false.obs;
  var isAgreedForTermsAndConditions = false.obs;
  var isFormValidated = false.obs;
  //textfield controllers
  var nameController = TextEditingController().obs;

  var placeController = TextEditingController().obs;
  var exactLocationController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  
}
