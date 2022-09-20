import 'package:blood_dontaion_app/core/colors/heigths_and_widths.dart';
import 'package:blood_dontaion_app/get/controllers/scroll_controller.dart';
import 'package:blood_dontaion_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NeedHelpScreen extends StatelessWidget {
  NeedHelpScreen({super.key});
  final _scrollController = Get.find<ScrollOffsetController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(title: 'Help', controller: _scrollController),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  RoundImageWidget(
                    imageName: "haritha_logo.png",
                  ),
                  kWidth10,
                  Text(
                    " Haritha Club",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  RoundImageWidget(
                    imageName: "feedback.png",
                  ),
                  kWidth10,
                  Text(
                    " Feedback",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
              expandedAlignment: Alignment.topLeft,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  RoundImageWidget(imageName: "developer.png"),
                  kWidth10,
                  Text(
                    "About developer",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Mohamed Nishad",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                kHeight10,
                const Text("Malappuram"),
                kHeight10,
                GestureDetector(
                  onTap: () {
                    print("nishadns");
                  },
                  child: const Text(
                    "nishadns321@gmail.com",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
                kHeight20,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoundImageWidget extends StatelessWidget {
  const RoundImageWidget({
    Key? key,
    required this.imageName,
  }) : super(key: key);
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage("assets/images/$imageName"), fit: BoxFit.cover),
      ),
    );
  }
}
