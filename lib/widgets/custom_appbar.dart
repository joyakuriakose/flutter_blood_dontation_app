import 'package:blood_dontaion_app/core/colors/colors.dart';
import 'package:blood_dontaion_app/get/controllers/scroll_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


AppBar customAppbar(
    {required String title,
    bool isScrollableBody = true,
    ScrollOffsetController? controller}) {
  return AppBar(
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
    ),
    toolbarHeight: 70,
    backgroundColor: isScrollableBody
        ? kBloodColor.withOpacity((controller!.offset.value / 350).clamp(0, 1))
        : Colors.transparent,
    leadingWidth: 60,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/haritha_logo.png'),
                      fit: BoxFit.contain)),
            )
          ],
        ),
      )
    ],
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.circular(100),
            elevation: 7,
            shadowColor: kBloodColor,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                iconSize: 25,
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    centerTitle: false,
    title: AnimatedDefaultTextStyle(
      curve: Curves.easeInOut,
      style: TextStyle(
          color: controller!.offset.value > 150 ? Colors.white : Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold),
      duration: const Duration(milliseconds: 500),
      child: Text(
        title,
      ),
    ),
  );
}
