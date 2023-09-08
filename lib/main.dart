import 'package:auth_app/Lessons.dart';
import 'package:auth_app/my_home_page.dart';
import 'package:auth_app/stages_levels/Level1.dart';
import 'package:auth_app/stages_levels/Level2.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'dart:convert' as convert;


import 'package:auth_app/WelcomeScreen.dart';
import 'package:auth_app/phone_Auth/SignUpScreen.dart';
import 'package:auth_app/phone_Auth/phone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:auth_app/phone_Auth/verify.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'phone',
      debugShowCheckedModeBanner: false,
      routes: {

        'phone': (context) => MyPhone(),
        'verify': (context) =>MyVerify(),
        'home':(context)=>MyHomePage(),
        SubjectsScreen.id:(context)=>SubjectsScreen(),
        Level1.id:(context)=>Level1(),
        Level2.id:(context)=>Level2(),

      },
    );
  }
}
