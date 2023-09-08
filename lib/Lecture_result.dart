import 'package:flutter/material.dart';

class LectureResult extends StatefulWidget {
  final String lectureResult;
  const
  LectureResult({required this.lectureResult,Key? key}) : super(key: key);

  @override
  State<LectureResult> createState() => _LectureResultState();
}

class _LectureResultState extends State<LectureResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,

      ),
      body: Container(
        child: Center(
          child:
          Image.network(widget.lectureResult),
        ),
      ),
    );
  }
}
