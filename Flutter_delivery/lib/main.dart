import 'package:flutter/material.dart';
import 'package:flutter_application_delivery/src/feature/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery app',
      home: SplashScreen(),
    );
  }
}
