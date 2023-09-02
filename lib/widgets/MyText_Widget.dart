import 'package:flutter/material.dart';



class MyText extends StatelessWidget {
  String title;
  MyText({required this.title ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),);
  }
}
