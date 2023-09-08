import 'package:auth_app/Feedback_Model.dart';
import 'package:auth_app/Screens/k2Arabic_lecture_screen.dart';
import 'package:auth_app/Screens/k2Arabic_video_screen.dart';
import 'package:auth_app/lessons_info_from_excal.dart';
import 'package:flutter/material.dart';

import 'dart:convert'as convert;
import 'package:http/http.dart'as http;

class ArabicLessonsScreen extends StatefulWidget {
  const ArabicLessonsScreen({Key? key}) : super(key: key);

  @override
  State<ArabicLessonsScreen> createState() => _ArabicLessonsScreenState();
}
String Title='';
String onpress='';



void whenButtonPressed(String button,context)
{
  if(button=='video')
  {

    Navigator.push(context, MaterialPageRoute(builder: (context)=> K2VideoReading()));

  }
  else if(button=='lecture')
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> K2LectureReading()));

  }
  else
  {
    Title= '';
   onpress='';


  }

}

List<FeedBackModel> feedbacks=<FeedBackModel>[];
String apiEndpoint="https://script.google.com/macros/s/AKfycbzgCvxt-tqIeyTgqEK_kPIAWVUaBMiF3e1zVE53Df9d_brrkIUppH14RbJuz8VQOetw/exec";

class _ArabicLessonsScreenState extends State<ArabicLessonsScreen> {

  getFeedbackFromSheet()
  async{
    try {

      print('hello world');
      // Replace with your own api url

      final Uri url = Uri.parse(apiEndpoint);
      print(url);
      var response = await http.get(url);
      print('hiii!$response');

      if (response.statusCode == 200) {
        var jsonsDataString = response.body.toString(); // toString of Response's body is assigned to jsonDataString
        thereIsData=true;
        var jsonsDataDecode=convert.jsonDecode(jsonsDataString);
        print(jsonsDataDecode);
        jsonsDataDecode.forEach((element){

          FeedBackModel feedbackModel=new FeedBackModel(
            k1ArabicTitle: element['K1_arabic_title'],
            k1ArabicYoutubeUrl:  element['k1_arabic_youtube_url'],
            k1MathTitle:  element['K1_math_title'],
            k1MathYoutubeUrl:  element['K1_math_youtube_url'],
            k1ScienceTitle: element['K1_science_title'],
            k1ScienceYoutubeUrl:element['K1_science_youtube_url'],
            k1MathLecture: element['K1_math_lecture'],
            k1ScienceLecture:element['K1_science_lecture'],
            k1EnglishTitle: element['K1_english_title'],
            k1EnglishYoutube: element['K1_english_youtube_url'],
            k1EnglishLecture: element['K1_english_lecture'],
            k2ArabicLectureTitle: element['K2_arabic_lecture'],
            k2ArabicLectureLink: element['K2_arabic_lecture_link'],
            k2ArabicTitle: element['K2_arabic_title'],
            k2ArabicYoutubeUrl: element['K2_arabic_youtube_url'],
            k2MathTitle: element['K2_math_title'],
            k2MathLecture: element['K2_math_lecture'],
            k2MathYoutube: element['K2_math_youtube_url'],
            k2ScienceTitle:element['K2_science_title'],
            k2ScienceLecture: element['K2_science_lecture'],
            k2ScienceYoutube: element['K2_science_youtube_url'],
            k2EnglishTitle: element['K2_english_title'],
            k2EnglishLecture: element['K2_english_lecture'],
            k2EnglishYoutube: element['K2_english_youtube_url'],
          );


          feedbacks.add(feedbackModel);
          print(feedbacks.length);
        });

        print(thereIsData);
      };

    } catch (err) {
      // Handling error

      print('error ${err}');
    }
    setState(() {

    });
  }
  @override
  void initState() {
   setState(() {
     getFeedbackFromSheet();
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
            ),

            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30.0,
                    child: Center(
                      child: IconButton(
                        onPressed: (){

                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios,size: 30,color: Colors.grey,),
                      ),
                    ),
                  ),
                  Text('المرحلة الثانية',style: TextStyle(fontSize: 30,color: Colors.amberAccent),),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.notifications,size: 30,color: Colors.grey,),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
             Container(
               height: 200,
             ),
              ElevatedButton(onPressed: (){
                whenButtonPressed('video', context);

              },
                  child: Text('Videos',style: TextStyle(fontSize: 30),)),

              SizedBox(
                height: 20,
              ),
              ElevatedButton(

                  onPressed: (){
                whenButtonPressed('lecture', context);
              },
                  child: Text('Lectures',style: TextStyle(fontSize: 30),)),

            ],
          ),
        ],
      ),
    );
  }
}
