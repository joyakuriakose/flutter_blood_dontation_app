import 'package:blood_dontaion_app/models/donor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Donor> donors = <Donor>[].obs;
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

  getData() async {
    final data = await FirebaseFirestore.instance.collection('donors').get();

    final listOfDonors =
        data.docs.map((e) => Donor.fromJson(e.data())).toList();
    donors.addAll(listOfDonors);

    isLoading.value = false;
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  selectBloodType() async {
    isLoading.value = true;
    donors.clear();
    final data = await FirebaseFirestore.instance.collection('donors').get();
    final listOfDonors =
        data.docs.map((e) => Donor.fromJson(e.data())).toList();

    if (bloodGroups[selectedType.value] == "All") {
      donors.addAll(listOfDonors);
      isLoading.value = false;
    } else {
      for (var donor in listOfDonors) {
        if (donor.bloodType == bloodGroups[selectedType.value]) {
          donors.add(donor);
        }
      }
      isLoading.value = false;
    }
  }
}
