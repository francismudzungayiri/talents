import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talents/constants.dart';
import 'package:talents/controllers/auth_controller.dart';
import 'package:talents/views/sreens/authScreens/login_screen.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'An app where disabled people showcase their talents',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: Login()
    );
  }
}
