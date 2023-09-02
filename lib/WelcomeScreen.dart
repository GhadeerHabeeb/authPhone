import 'package:auth_app/phone_Auth/SignUpScreen.dart';
import 'package:flutter/material.dart';

import 'widgets/MyText_Widget.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Container(
    padding: EdgeInsets.all(30),
    child: Text('WelcomeScreen',style: TextStyle(fontSize: 30),),
  ),
    );
  }
}

 
