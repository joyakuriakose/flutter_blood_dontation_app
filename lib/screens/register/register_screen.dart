import 'package:blood_dontaion_app/core/colors/colors.dart';
import 'package:blood_dontaion_app/core/colors/heigths_and_widths.dart';
import 'package:blood_dontaion_app/get/controllers/register_form_controller.dart';
import 'package:blood_dontaion_app/get/controllers/register_page_view_controller.dart';
import 'package:blood_dontaion_app/get/controllers/scroll_controller.dart';
import 'package:blood_dontaion_app/models/donor_model.dart';
import 'package:blood_dontaion_app/widgets/custom_appbar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final RegisterPageViewController _registerPageViewController =
      Get.find<RegisterPageViewController>();
  final RegisterFormController _registerFormController =
      Get.find<RegisterFormController>();
  final ScrollOffsetController _offsetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppbar(
        title: 'Register',
        isScrollableBody: false,
        controller: _offsetController,
      ),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: PageView(
              pageSnapping: true,
              controller: _registerPageViewController.pageController.value,
              physics: const BouncingScrollPhysics(),
              allowImplicitScrolling: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                if (index == 1) {
                  checkIsFormValidated();
                  if (_registerFormController.isFormValidated.value == false) {
                    _registerPageViewController.pageController.value
                        .animateToPage(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInCirc);
                  }
                }
                _registerPageViewController.index.value = index;
              },
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 80, left: 20, right: 20, bottom: 100),
                  padding: const EdgeInsets.all(20),
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: kBloodColor.withOpacity(0.6),
                            offset: const Offset(1, 1),
                            blurRadius: 20,
                            spreadRadius: 7)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/haritha_logo.png'),
                                  fit: BoxFit.contain),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      RegisterTextfieldWidget(
                        controller:
                            _registerFormController.nameController.value,
                        hint: 'Name',
                      ),
                      RegisterTextfieldWidget(
                        controller:
                            _registerFormController.placeController.value,
                        hint: 'Place',
                      ),
                      RegisterTextfieldWidget(
                        controller: _registerFormController
                            .exactLocationController.value,
                        hint: 'Exact Location',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: 40,
                            child: Obx(
                              () => TextField(
                                onTap: () async {
                                  await selectDate(context);
                                },
                                readOnly: true,
                                controller:
                                    _registerFormController.dobController.value,
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: 'Date of birth',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      RegisterTextfieldWidget(
                        controller:
                            _registerFormController.phoneController.value,
                        hint: 'Phone number',
                        isNumberKeyboard: true,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 80, left: 20, right: 20, bottom: 100),
                  padding: const EdgeInsets.all(20),
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: kBloodColor.withOpacity(0.6),
                          offset: const Offset(1, 1),
                          blurRadius: 20,
                          spreadRadius: 7,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Select blood type
                      const Text(
                        'Choose Your Blood type',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                _registerFormController
                                    .selectedBloodGroup.value = index;
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Obx(
                                    () => Icon(
                                      _registerFormController
                                                  .selectedBloodGroup.value ==
                                              index
                                          ? Icons.water_drop
                                          : Icons.water_drop_outlined,
                                      color: Colors.red,
                                      size: 80,
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      _registerFormController
                                          .bloodGroups[index],
                                      style: TextStyle(
                                          fontSize: _registerFormController
                                                      .selectedBloodGroup
                                                      .value ==
                                                  index
                                              ? 21
                                              : 18,
                                          color: _registerFormController
                                                      .selectedBloodGroup
                                                      .value ==
                                                  index
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: _registerFormController.bloodGroups.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    _registerFormController
                                        .selectedProfession.value = index;
                                    if (_registerFormController.professions[
                                            _registerFormController
                                                .selectedProfession.value] !=
                                        "Working") {
                                      _registerFormController
                                          .showAbroadOption.value = false;
                                    } else {
                                      _registerFormController
                                          .showAbroadOption.value = true;
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOutCirc,
                                    alignment: Alignment.center,
                                    width: 80,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: _registerFormController
                                                    .selectedProfession.value ==
                                                index
                                            ? Colors.red
                                            : Colors.transparent,
                                        border: _registerFormController
                                                    .selectedProfession.value ==
                                                index
                                            ? null
                                            : Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      _registerFormController
                                          .professions[index],
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: _registerFormController
                                                      .selectedProfession
                                                      .value ==
                                                  index
                                              ? Colors.white
                                              : Colors.red,
                                          fontWeight: _registerFormController
                                                      .selectedProfession
                                                      .value ==
                                                  index
                                              ? FontWeight.bold
                                              : FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Obx(
                        () => _registerFormController.showAbroadOption.value
                            ? SizedBox(
                                height: 70,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Working on",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        itemBuilder: (ctx, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Obx(
                                              () => GestureDetector(
                                                onTap: () {
                                                  _registerFormController
                                                      .selectedAbroadOption
                                                      .value = index;
                                                },
                                                child: AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.easeInOutQuad,
                                                  alignment: Alignment.center,
                                                  width: 100,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: _registerFormController
                                                                .selectedAbroadOption
                                                                .value ==
                                                            index
                                                        ? Colors.black
                                                        : Colors.transparent,
                                                    border: _registerFormController
                                                                .selectedAbroadOption
                                                                .value ==
                                                            index
                                                        ? null
                                                        : Border.all(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Text(
                                                    _registerFormController
                                                        .abroadOptions[index],
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        color: _registerFormController
                                                                    .selectedAbroadOption
                                                                    .value ==
                                                                index
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontWeight:
                                                            _registerFormController
                                                                        .selectedAbroadOption
                                                                        .value ==
                                                                    index
                                                                ? FontWeight
                                                                    .bold
                                                                : FontWeight
                                                                    .w400),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: 2,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                      //confirm willing to donate blood
                      Row(
                        children: [
                          const Text(
                            "Iam willing to donate my blood",
                            style: TextStyle(
                                height: 0,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Obx(
                            () => Checkbox(
                                activeColor: Colors.blue,
                                value: _registerFormController
                                    .isWillingToDonateBlood.value,
                                onChanged: (value) {
                                  _registerFormController
                                      .isWillingToDonateBlood.value = value!;
                                }),
                          ),
                        ],
                      ),
                      //agree to terms and conditions
                      Row(
                        children: [
                          const Text(
                            "I agree to the ",
                            style: TextStyle(
                                height: 0,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              showTermsAndConditions();
                            },
                            child: const Text(
                              "terms and conditons",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Obx(
                            () => Checkbox(
                                activeColor: Colors.blue,
                                value: _registerFormController
                                    .isAgreedForTermsAndConditions.value,
                                onChanged: (value) {
                                  _registerFormController
                                      .isAgreedForTermsAndConditions
                                      .value = value!;
                                }),
                          ),
                        ],
                      ),
                      //confirm button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Obx(
                              () => ElevatedButton(
                                onPressed: _registerFormController
                                            .isWillingToDonateBlood.value &&
                                        _registerFormController
                                                .isAgreedForTermsAndConditions
                                                .value ==
                                            true
                                    ? () {
                                        validateSecondPage();
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  disabledBackgroundColor:
                                      kBloodColor.withOpacity(0.1),
                                  backgroundColor: Colors.white,
                                  side: const BorderSide(color: Colors.red),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: _registerFormController
                                            .isWillingToDonateBlood.value &&
                                        _registerFormController
                                            .isAgreedForTermsAndConditions.value
                                    ? const Text(
                                        "Submit",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const Icon(
                                        Icons.update_disabled,
                                        color: Colors.black,
                                      ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 110,
            left: 170,
            child: Obx(
              () => DotsIndicator(
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                dotsCount: 2,
                position: _registerPageViewController.index.value.toDouble(),
              ),
            ),
          )
        ],
      ),
      floatingActionButton:
          Obx(() => _registerPageViewController.index.value == 0
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: FloatingActionButton.extended(
                    elevation: 5,
                    backgroundColor: Colors.red[500],
                    onPressed: () {
                      checkIsFormValidated();
                      if (_registerFormController.isFormValidated.value ==
                          true) {
                        _registerPageViewController.pageController.value
                            .animateToPage(1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                      }
                    },
                    label: Row(
                      children: const [
                        Text('Continue'),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward,
                          size: 17,
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  checkIsFormValidated() {
    final name = _registerFormController.nameController.value.text;
    final place = _registerFormController.placeController.value.text;
    final exactLocation =
        _registerFormController.exactLocationController.value.text;
    final dateOfBirth =
        _registerFormController.dobController.value.text.trimRight();
    final phone = _registerFormController.phoneController.value.text.trim();
    if (!(name == "" ||
        place == "" ||
        exactLocation == "" ||
        dateOfBirth == "" ||
        phone == "")) {
      //check phone number length
      if ((phone.length == 10)) {
        _registerFormController.isFormValidated.value = true;
      } else {
        showCustomSnackBar(
            title: 'Invalid phone number 📞',
            message: 'Check entered phone number and try again');
        _registerFormController.isFormValidated.value = false;
      }
    } else {
      _registerFormController.isFormValidated.value = false;
      showCustomSnackBar(title: 'Uh oh😞', message: 'Fileds cannot be empty');
    }
  }

  void validateSecondPage() {
    String? livingIn;
    final selectedBloodGroup = _registerFormController
        .bloodGroups[_registerFormController.selectedBloodGroup.value];
    final selectedProfession = _registerFormController
        .professions[_registerFormController.selectedProfession.value];
    if (selectedProfession == "Working") {
      livingIn = _registerFormController
          .abroadOptions[_registerFormController.selectedAbroadOption.value];
    }
    final name = _registerFormController.nameController.value.text;
    final place = _registerFormController.placeController.value.text;
    final exactLocation =
        _registerFormController.exactLocationController.value.text;
    final dateOfBirth =
        _registerFormController.dobController.value.text.trimRight();
    final phone = _registerFormController.phoneController.value.text.trim();
    final Donor donorModel = Donor(
        name: name,
        place: place,
        exactLocation: exactLocation,
        dob: dateOfBirth,
        phone: phone,
        bloodType: selectedBloodGroup,
        profession: selectedProfession,
        workingIn: livingIn);

    final isAdult = checkIsadult(dateOfBirth);
    if (isAdult) {
      reviewDetails(donorModel);
    } else {
      showNotAdultDialog();
    }
  }

  showNotAdultDialog() {
    Get.defaultDialog(
        backgroundColor: kBloodColor,
        titleStyle: const TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        middleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        cancelTextColor: Colors.white,
        title: 'Sorry ☹',
        middleText:
            'You must be 18 years old inorder to register for blood donation',
        textCancel: 'Cancel',
        onCancel: () {
          Get.back();
        });
  }

  bool checkIsadult(String birthDateString) {
    String datePattern = "dd-MM-yyyy";

    // Current time - at this moment
    DateTime today = DateTime.now();

    // Parsed date to check
    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);

    // Date to check but moved 18 years ahead
    DateTime adultDate = DateTime(
      birthDate.year + 18,
      birthDate.month,
      birthDate.day,
    );

    return adultDate.isBefore(today);
  }

  Future<void> selectDate(BuildContext context) async {
    await DatePicker.showDatePicker(
      context,
      minTime: DateTime(1920),
      maxTime: DateTime.now(),
      theme: const DatePickerTheme(
          containerHeight: 150, backgroundColor: Colors.white),
      onCancel: () {
        Get.showSnackbar(const GetSnackBar(
          duration: Duration(seconds: 1),
          snackStyle: SnackStyle.GROUNDED,
          messageText: Text(
            "Date selection cancelled",
            style: TextStyle(color: Colors.white),
          ),
        ));
      },
      onConfirm: (pickedDate) {
        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
        _registerFormController.dobController.value.text = formattedDate;
        _registerFormController.dobInDateTimeController.value = pickedDate;
      },
    );
  }

//creates alert dialg on terms and condtions
  void showTermsAndConditions() {
    Get.defaultDialog(
        titlePadding: const EdgeInsets.symmetric(vertical: 20),
        textCancel: 'Close',
        backgroundColor: Colors.grey[200],
        title: "Terms and conditions",
        middleText:
            "1.We use your data for blood donation puposes only \n2.We don't share your data to any other firm");
  }

//Custom getx snackbar
  void showCustomSnackBar({required String title, required String message}) {
    Get.showSnackbar(GetSnackBar(
      titleText: Text(
        title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.red),
      ),
      backgroundColor: Colors.grey[200]!,
      duration: const Duration(milliseconds: 2000),
    ));
  }

  //review details for user to recheck entered details
  reviewDetails(Donor person) async {
    Get.defaultDialog(
        titlePadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textCancel: 'Edit',
        textConfirm: 'Confirm',
        confirmTextColor: Colors.white,
        onConfirm: () {},
        onCancel: () {
          _registerPageViewController.pageController.value.animateToPage(0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInCirc);
        },
        backgroundColor: Colors.grey[200],
        title: "Review your info",
        content: Column(
          children: [
            ReviewWidget(title: "Name", value: person.name),
            ReviewWidget(title: "Place", value: person.place),
            ReviewWidget(title: "Exact location", value: person.exactLocation),
            ReviewWidget(title: "Date of birth", value: person.dob),
            ReviewWidget(title: "Phone", value: person.phone),
            ReviewWidget(title: "Blood group", value: person.bloodType),
            ReviewWidget(title: "Profession", value: person.profession),
            person.workingIn != null
                ? ReviewWidget(title: "Working in", value: person.workingIn!)
                : const SizedBox.shrink()
          ],
        ));
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$title :",
          style: const TextStyle(color: Colors.grey, fontSize: 18),
        ),
        kWidth10,
        Text(
          value,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        )
      ],
    );
  }
}

class RegisterTextfieldWidget extends StatelessWidget {
  const RegisterTextfieldWidget(
      {Key? key,
      required this.controller,
      required this.hint,
      this.isNumberKeyboard = false})
      : super(key: key);
  final TextEditingController controller;
  final String hint;
  final bool isNumberKeyboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 40,
          child: TextField(
            keyboardType:
                isNumberKeyboard ? TextInputType.phone : TextInputType.text,
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 15)),
          ),
        ),
      ),
    );
  }
}
