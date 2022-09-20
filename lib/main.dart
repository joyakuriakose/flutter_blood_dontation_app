import 'package:blood_dontaion_app/get/bindings/bindings.dart';
import 'package:blood_dontaion_app/get/splash_controller.dart';
import 'package:blood_dontaion_app/screens/home/home_screen.dart';
import 'package:blood_dontaion_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SplashController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),

      ],
     
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.black)),
      ),
      home: const SplashScreen(),
    );
  }
}
