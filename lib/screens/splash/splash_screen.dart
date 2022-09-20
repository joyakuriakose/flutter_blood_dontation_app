import 'package:blood_dontaion_app/core/colors/colors.dart';
import 'package:blood_dontaion_app/core/font_style.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBloodColor,
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                height: size.width * .9,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/donation.png'),
                        fit: BoxFit.cover)),
              ),
              const Spacer(),
              Text(
                'An Initiative by',
                style: TextStyle(
                    color: Colors.grey[300], fontFamily: kCursiveFont),
              ),
              Text(
                'HARITHA CLUB',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: kCursiveFont,
                    color: Colors.white),
              ),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
