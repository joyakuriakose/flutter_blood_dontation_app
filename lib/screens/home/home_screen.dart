import 'package:blood_dontaion_app/core/colors/colors.dart';
import 'package:blood_dontaion_app/core/font_style.dart';
import 'package:blood_dontaion_app/get/bindings/bindings.dart';
import 'package:blood_dontaion_app/get/bindings/register_bindings.dart';
import 'package:blood_dontaion_app/get/bindings/scrolloffset_binding.dart';
import 'package:blood_dontaion_app/screens/blood%20groups/blood_groups_screen.dart';
import 'package:blood_dontaion_app/screens/find%20donor/find_donor_screen.dart';
import 'package:blood_dontaion_app/screens/help/help_screen.dart';
import 'package:blood_dontaion_app/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: SafeArea(
                child: SizedBox(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              'HARITHA CLUB',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 4),
                                  decoration:
                                      const BoxDecoration(color: Colors.red),
                                  child: const Text(
                                    'BLOOD',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'GROUP',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'DIRECTORY',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Be a hero, Donate blood!',
                              style: TextStyle(
                                  color: kBloodColor.withOpacity(0.9),
                                  letterSpacing: 1,
                                  fontSize: 20,
                                  fontFamily: kCursiveFont,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/haritha_logo.png",
                                width: 100,
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[100],
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20,
                  ),
                  children: [
                    HomeTileButton(
                      icon: Icons.person_add,
                      text: 'Register',
                      ontap: () {
                        Get.to(() => RegisterScreen(),
                            binding: RegisterPageBinding(),
                            transition: Transition.upToDown);
                      },
                    ),
                    HomeTileButton(
                      icon: Icons.bloodtype,
                      text: 'Blood Groups',
                      ontap: () {
                        Get.to(() => BloodBankScreen(),
                            binding: BloodGroupBinding(),
                            transition: Transition.upToDown);
                      },
                    ),
                    HomeTileButton(
                      icon: Icons.person_search,
                      text: 'Find Donor',
                      ontap: () {
                        Get.bottomSheet(FindDonorScreen());
                      },
                    ),
                    HomeTileButton(
                      icon: Icons.help_center,
                      text: 'Need help?',
                      ontap: () {
                        Get.to(() => NeedHelpScreen(),
                            binding: ScrollOffsetBinding(),
                            transition: Transition.upToDown);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                '© Haritha Club Kozhikkottuparamb',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeTileButton extends StatelessWidget {
  const HomeTileButton({
    Key? key,
    required this.text,
    required this.ontap,
    required this.icon,
  }) : super(key: key);
  final String text;
  final VoidCallback ontap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
                color: kBloodColor,
              ),
              const SizedBox(height: 10),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
