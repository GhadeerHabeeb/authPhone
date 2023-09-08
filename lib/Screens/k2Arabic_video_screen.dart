import 'package:auth_app/video.dart';
import 'package:flutter/material.dart';

import '../lessons_info_from_excal.dart';


class K2VideoReading extends StatefulWidget {
  const K2VideoReading({Key? key}) : super(key: key);

  @override
  State<K2VideoReading> createState() => _K2VideoReadingState();
}

class _K2VideoReadingState extends State<K2VideoReading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          ListView.builder(

            itemCount: feedbacks.length,
            itemBuilder: (BuildContext context, int index) {
              return feedbacks[index].k2ArabicTitle==''?null:
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
                    child:  Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(feedbacks[index].k2ArabicTitle ,style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
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


                                Navigator.push(context,  MaterialPageRoute(builder: (context) =>   Video(id: feedbacks[index].k2ArabicYoutubeUrl,index: index,)));
                              }, child: Text('watch video',style: TextStyle(fontSize: 25))),


                        ],
                      ),
                    ),
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
                    child: Icon(Icons.menu,size: 30,color: Colors.grey,),
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
