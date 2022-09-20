import 'package:blood_dontaion_app/core/colors/colors.dart';
import 'package:blood_dontaion_app/core/colors/heigths_and_widths.dart';
import 'package:blood_dontaion_app/get/controllers/firebase_controller.dart';
import 'package:blood_dontaion_app/get/controllers/scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/donor_model.dart';
import '../../widgets/custom_appbar.dart';

class BloodBankScreen extends StatelessWidget {
  BloodBankScreen({super.key});

  final ScrollOffsetController _scrollOffsetController =
      Get.find<ScrollOffsetController>();
  final FirebaseController _firebaseController = Get.find<FirebaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Obx(
          () => customAppbar(
              title: 'Blood Groups', controller: _scrollOffsetController),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "In Need for",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    _firebaseController.selectedType.value =
                                        index;
                                    _firebaseController.selectBloodType();
                                  },
                                  child: Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(10),
                                    child: AnimatedContainer(
                                      curve: Curves.easeInOut,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      alignment: Alignment.center,
                                      width: _firebaseController
                                                  .selectedType.value ==
                                              index
                                          ? 63
                                          : 55,
                                      decoration: BoxDecoration(
                                          color: _firebaseController
                                                      .selectedType.value ==
                                                  index
                                              ? kBloodColor
                                              : kBloodColor.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        _firebaseController.bloodGroups[index],
                                        style: TextStyle(
                                            color: _firebaseController
                                                        .selectedType.value ==
                                                    index
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: _firebaseController.bloodGroups.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: Obx(
              () => _firebaseController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : _firebaseController.donors.isNotEmpty
                      ? ListView.builder(
                          itemBuilder: (ctx, index) {
                            return DonorTileWidget(
                              donor: _firebaseController.donors[index],
                            );
                          },
                          controller: _scrollOffsetController.scrollController,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(top: 0),
                          itemCount: _firebaseController.donors.length,
                        )
                      : Text("Nothing here"),
            )),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(100),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: _scrollOffsetController.offset.value > 150 ? 40 : 0,
            width: _scrollOffsetController.offset.value > 150 ? 40 : 0,
            decoration:
                const BoxDecoration(color: kBloodColor, shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  _scrollOffsetController.scrollController.position.animateTo(0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                icon: Icon(
                  Icons.keyboard_arrow_up,
                  size: _scrollOffsetController.offset.value > 150 ? 25 : 0,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}

class DonorTileWidget extends StatelessWidget {
  const DonorTileWidget({
    Key? key,
    required this.donor,
  }) : super(key: key);
  final Donor donor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          showDonorInfo(donor);
        },
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: kBloodColor,
                  child: Text(
                    donor.bloodType,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          donor.name.capitalizeFirst!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          donor.place,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        Text(
                          donor.phone,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDonorInfo(Donor donor) {
    Get.bottomSheet(
      Container(
        height: 600,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: kBloodColor,
                  radius: 30,
                  child: Text(
                    donor.bloodType,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 23),
                  ),
                ),
                kHeight20,
                Text(
                  donor.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                kHeight10,
                Text(
                  donor.phone,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                      text: '${donor.exactLocation},',
                      style: const TextStyle(color: Colors.grey, fontSize: 19),
                      children: [
                        TextSpan(
                            text: " ${donor.place}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold))
                      ]),
                ),
                kHeight10,
                donor.profession != "Other"
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            donor.profession,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          ),
                          donor.workingIn != null
                              ? Text(
                                  ", ${donor.workingIn!}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                )
                              : const SizedBox.shrink(),
                        ],
                      )
                    : const SizedBox.shrink(),
                kHeight10,
                Text(
                  donor.dob,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                kHeight10,
                OutlinedButton.icon(
                  onPressed: () {
                    print(donor.phone);
                  },
                  icon: const Icon(
                    Icons.call,
                    size: 20,
                  ),
                  label: const Text("Call now"),
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                kHeight20,
                Image.asset(
                  "assets/images/haritha_logo.png",
                  height: 80,
                  width: 80,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
