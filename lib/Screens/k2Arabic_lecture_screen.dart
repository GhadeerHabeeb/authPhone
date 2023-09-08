import 'package:auth_app/Feedback_Model.dart';
import 'package:auth_app/Lecture_result.dart';
import 'package:auth_app/lessons_info_from_excal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'dart:convert'as convert;
import 'package:http/http.dart'as http;
class K2LectureReading extends StatefulWidget {

  K2LectureReading({Key? key}) : super(key: key);

  @override
  State<K2LectureReading> createState() => _K2LectureReadingState();
}
List<FeedBackModel> feedbacks=<FeedBackModel>[];
String apiEndpoint="https://script.google.com/macros/s/AKfycbzgCvxt-tqIeyTgqEK_kPIAWVUaBMiF3e1zVE53Df9d_brrkIUppH14RbJuz8VQOetw/exec";

class _K2LectureReadingState extends State<K2LectureReading> {
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

     getFeedbackFromSheet();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  Stack(
        children: [
          ListView.builder(

            itemCount: feedbacks.length,
            itemBuilder: (BuildContext context, int index) {

              return feedbacks[index].k2ArabicLectureTitle==''?null:
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                      boxShadow: [BoxShadow(
                          blurRadius: 0.9,
                          spreadRadius: 0.9,
                          color: Colors.grey,
                          offset: Offset(3, 4)
                      )],
                    ),

                      height: 300,
                      width: 400,
                    child:  Stack(
                      children: [
                        ClipPath(
                          clipper: WaveClipperTwo(flip: true),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.purpleAccent.withOpacity(0.5),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),

                            ),
                            height: 180,
                            child:
                            Center(child: Text( '${feedbacks[index].k2ArabicLectureTitle}' ,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),

                          ),
                        ),
                        Positioned(
                          top: 150,
                          right: 110,
                          child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff7FC557),
                                      side: BorderSide(
                                          width: 0.2,
                                          color: Colors.grey
                                      ),
                                      minimumSize: Size(100, 50),

                                    ),
                                    onPressed: (){

                                      Navigator.push(context,  MaterialPageRoute(builder: (context) => LectureResult(lectureResult: feedbacks[index].k2ArabicLectureLink,)));
                                    }, child: Text('watch result',style: TextStyle(fontSize: 25))),
                        ),]
                    )



                  ),
                ),
              );
            },
          ),
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
        ],
      ),
    );
  }
}
