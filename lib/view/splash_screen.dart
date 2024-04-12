import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_2024/controller/splash_screen_controller.dart';
import 'package:getx_mvvm_2024/data/app_exceptions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SplashScreenController splashScreenController = Get.put(SplashScreenController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw InternetException("Zahid internet on karo phly");
        },
      ),
    );
  }
}
