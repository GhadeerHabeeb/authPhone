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
        'welcome':(context)=>WelcomeScreen(),

      },
    );
  }
}
