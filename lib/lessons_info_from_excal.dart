import 'package:auth_app/Feedback_Model.dart';
import 'package:auth_app/Lecture_result.dart';
import 'package:auth_app/video.dart';
import 'package:flutter/material.dart';
import 'dart:convert'as convert;
import 'package:http/http.dart'as http;


class LessonsScreen extends StatefulWidget {
  final String lessonTitle;
  final String level;
  final colors ;
   const LessonsScreen({required this.colors,required this.level,required this.lessonTitle,Key? key}) : super(key: key);
  @override
  State<LessonsScreen> createState() => _LessonsScreenState();
}
String Title='';
String video='';
String result='';
var LevelName='';

bool thereIsData=false;

Level(String level)
{
  if(level=='level1')
    {
      LevelName='المرحلة الاولى';

    }
  else if(level=='level2')
    {
      LevelName='المرحلة الثاني';
    }
  else{
    LevelName='';
  }
}
WhatLesson(String lessonTitle,int index,String level)
{

  if(level=='level1')
  {
    if (lessonTitle == 'Math') {
      Title = '${feedbacks[index].k1MathTitle}';
      video = '${feedbacks[index].k1MathYoutubeUrl}';
      result = '${feedbacks[index].k1MathLecture}';
    } else if (lessonTitle == 'Reading') {
      Title = '${feedbacks[index].k1ArabicTitle}';
      video = '${feedbacks[index].k1ArabicYoutubeUrl}';
      result = '';
    } else if (lessonTitle == 'Science') {
      Title = '${feedbacks[index].k1ScienceTitle}';
      video = '${feedbacks[index].k1ScienceYoutubeUrl}';
      result = '${feedbacks[index].k1ScienceLecture}';
    }     else if (lessonTitle == 'English') {
      Title = '${feedbacks[index].k1EnglishTitle}';
      video = '${feedbacks[index].k1EnglishYoutube}';
      result = '${feedbacks[index].k1EnglishLecture}';
    }
    else {
      Title = '';
      video = '';
      result = '';
    }

  }
  else if(level=='level2')
  {
    if (lessonTitle == 'Math') {
      Title = '${feedbacks[index].k2MathTitle}';
      video = '${feedbacks[index].k2MathYoutube}';
      result = '${feedbacks[index].k2MathLecture}';
    }
    else if (lessonTitle == 'Science') {
      Title = '${feedbacks[index].k2ScienceTitle}';
      video = '${feedbacks[index].k2ScienceYoutube}';
      result = '${feedbacks[index].k2ScienceLecture}';
    }
    else if (lessonTitle == 'English') {
      Title = '${feedbacks[index].k2EnglishTitle}';
      video = '${feedbacks[index].k2EnglishYoutube}';
      result = '${feedbacks[index].k2EnglishLecture}';
    }
    else {
      Title = '';
      video = '';
      result = '';
    }

  }

}

List<FeedBackModel> feedbacks=<FeedBackModel>[];
String apiEndpoint="https://script.google.com/macros/s/AKfycbzgCvxt-tqIeyTgqEK_kPIAWVUaBMiF3e1zVE53Df9d_brrkIUppH14RbJuz8VQOetw/exec";


LineNumbers(String text)
{

}


class _LessonsScreenState extends State<LessonsScreen> {


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
    Level(widget.level);
    getFeedbackFromSheet();
    super.initState();
  }
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
      body: Stack(
        children: [
          thereIsData==true? ListView.builder(

            itemCount: feedbacks.length,
            itemBuilder: (BuildContext context, int index) {
              final numLines = '\n'.allMatches(Title).length + 1;
              return  FeedbacksTile(
                lessonTitle: widget.lessonTitle,
                numLines: numLines,
                index: index,
              color: widget.colors,
              level: widget.level,);








            /*  WhatLesson(widget.lessonTitle, index,widget.level);
              final numLines = '\n'.allMatches(Title).length + 1;
              return video==''||Title==''?Container(
               color:Colors.amberAccent,
              ):Padding(
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

                      height:numLines<=2? 300:500,
                      width: 400,
                    child:  Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(Title ,style: TextStyle(fontSize: 26),textAlign: TextAlign.center,),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent,
                            side: BorderSide(
                              width: 0.2,
                              color: Colors.grey
                            ),
                            minimumSize: Size(100, 50),

                          ),
                              onPressed: (){
                               setState(() {
                                 WhatLesson(widget.lessonTitle,index,widget.level);
                                 print(widget.level);
                                 Navigator.push(context,  MaterialPageRoute(builder: (context) =>   Video(id: video,index: index,)));
                               });
                              }, child: Text('watch video',style: TextStyle(fontSize: 25))),
                          SizedBox(
                            height: 10,
                          ),

                          result==''?Container():ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFFE4A0FF),
                                side: BorderSide(
                                    width: 0.2,
                                    color: Colors.grey
                                ),
                                minimumSize: Size(100, 50),

                              ),
                              onPressed: (){
                               setState(() {
                                 WhatLesson(widget.lessonTitle,index,widget.level);

                                 Navigator.push(context,  MaterialPageRoute(builder: (context) => LectureResult(lectureResult: result,)));
                               });
                              }, child: Text('watch result',style: TextStyle(fontSize: 25)))

                        ],
                      ),
                    ),
                      ),
                ),
              );*/
            },
          ):Center(
     child: LinearProgressIndicator(

     backgroundColor: Colors.amber,
       color: Colors.yellow,

     ),
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

                    ),
                  ),
                  Text(LevelName,style: TextStyle(fontSize: 30,color: Colors.amberAccent),),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.menu,size: 30,color: Colors.black,),
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

class FeedbacksTile extends StatelessWidget {
  String level;
  String lessonTitle;
  int index;
  int numLines;
  Color color;

    FeedbacksTile({required this.color,required this.lessonTitle, required this.numLines,required this.index ,required this.level,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WhatLesson(lessonTitle, index, level);
    return video==''?Container(
      color:Colors.amberAccent,
    ):Padding(
      padding:  EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.3),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            boxShadow: [BoxShadow(
                blurRadius: 0.9,
                spreadRadius: 0.9,
                color: Colors.white60,
                offset: Offset(3, 4)
            )],
          ),

          height:numLines<5? 300:500,
          width: 400,
          child:  Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(Title ,style: TextStyle(fontSize: 26),textAlign: TextAlign.center,),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      side: BorderSide(
                          width: 0.2,
                          color: Colors.grey
                      ),
                      minimumSize: Size(100, 50),

                    ),
                    onPressed: (){

                        WhatLesson(lessonTitle,index,level);

                        print(level);
                        Navigator.push(context,  MaterialPageRoute(builder: (context) =>   Video(id: video,index: index,)));

                    }, child: Text('watch video',style: TextStyle(fontSize: 25))),
                SizedBox(
                  height: 10,
                ),

                result==''?Container():ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFFE4A0FF),
                      side: BorderSide(
                          width: 0.2,
                          color: Colors.grey
                      ),
                      minimumSize: Size(100, 50),

                    ),
                    onPressed: (){
                        print(numLines);
                        WhatLesson(lessonTitle,index,level);

                        Navigator.push(context,  MaterialPageRoute(builder: (context) => LectureResult(lectureResult: result,)));

                    }, child: Text('watch result',style: TextStyle(fontSize: 25)))

              ],
            ),
          ),
        ),
      ),
    );
  }
}

