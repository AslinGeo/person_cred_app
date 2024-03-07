import 'package:cred_app/app/data/dao/hive_helper.dart';
import 'package:cred_app/app/pages/home/home.controller.dart';
import 'package:cred_app/app/pages/home/home.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveInitializer.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CRED APP",
      theme: ThemeData(),
      home: HomeView(),
    );
  }
}
