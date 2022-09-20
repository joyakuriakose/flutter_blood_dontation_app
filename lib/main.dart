import 'package:blood_dontaion_app/firebase_options.dart';
import 'package:blood_dontaion_app/get/controllers/splash_controller.dart';
import 'package:blood_dontaion_app/screens/home/home_screen.dart';
import 'package:blood_dontaion_app/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
