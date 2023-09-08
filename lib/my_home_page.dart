
import 'dart:convert';

import 'package:auth_app/StageData.dart';
import 'package:auth_app/stages_levels/Level1.dart';
import 'package:auth_app/stages_levels/Level2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

import 'package:http/http.dart'as http;

import 'dart:convert'as convert;


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget>items=[
    Image.asset('assets/L_images/30.png'),
    Image.asset('assets/L_images/31.png' ),
    Text('comming soon',style: TextStyle(color: Colors.blueGrey,fontSize: 25,fontWeight: FontWeight.bold),) ,
    Text('comming soon',style: TextStyle(color: Colors.blueGrey,fontSize: 25,fontWeight: FontWeight.bold),) ,
    Text('comming soon',style: TextStyle(color: Colors.blueGrey,fontSize: 25,fontWeight: FontWeight.bold),) ,

  ];
  int count=8;


  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Comming soon',style: TextStyle(fontSize: 30),),
        content: const Text('This level is locked',style: TextStyle(fontSize: 20),),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius:BorderRadius.circular(20),
                ),
                child: Center(child: const Text('Ok',style: TextStyle(fontSize: 30),))),
          ),

        ],
      ),
    );
  }

  bool isClicked=false;
  double Top=300.0;
  @override
  void initState() {

    super.initState();
    setState(() {

    });
  }




  @override
  Widget build(BuildContext context) {
    int i=10;
    return Scaffold(
      body:Stack(
          children: [

            Container(
              color: Colors.amberAccent,
            ),
            //this is images auto scrolling
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: ScrollLoopAuto(),
            ),
            //this is the listview of levels
            Center(
              child: Container(
                width: double.infinity,
                child: SizedBox.expand(
                  child: DraggableScrollableSheet(

                    builder: (BuildContext context, ScrollController scrollController) {
                      return Container(
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                        ),

                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: Center(
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                    ),

                                    height: 200,
                                    width: 400,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20.0,right: 20,left: 20,bottom: 20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  height:40,
                                                  width: 100,

                                                  decoration: BoxDecoration(
                                                      color:index<2? Colors.amberAccent:Colors.grey,
                                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                                                  ),
                                                  child: Center(child: Text('level ${index + 1}',style: TextStyle(fontSize: 25),))),

                                              CircleAvatar(
                                                backgroundColor:index<2? Colors.amberAccent:Colors.grey,
                                                radius: 30.0,
                                                child: Center(
                                                  child: IconButton(
                                                    onPressed: (){
                                                      if(index+1 ==1) {
                                                        Navigator.pushNamed(
                                                            context,
                                                            Level1.id,
                                                            arguments: ScreenArguments(
                                                                level: 'level${index +
                                                                    1}',
                                                                color: Colors
                                                                    .amberAccent));
                                                      }
                                                      else if(index+1==2)
                                                        {
                                                          Navigator.pushNamed(
                                                              context,
                                                              Level2.id,
                                                              arguments: ScreenArguments(
                                                                  level: 'level${index +
                                                                      1}',
                                                                  color: Colors
                                                                      .purpleAccent));
                                                        }
                                                      else {
                                                        _showAlertDialog(context);
                                                      }
                                                    },
                                                    icon: Icon(Icons.arrow_forward,size: 30,color: Colors.black,),
                                                  ),
                                                ),
                                              ),

                                            ],


                                          ),
                                        ),
                                        Container(
                                          height:200,
                                          width: 200,
                                          child:Center(child: items[index]),)
                                      ],
                                    )),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            //this is the app_bar
            Container(
              height: 90,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                  color: Colors.white,
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
                    Text('منجزون الغد',style: TextStyle(fontSize: 30,color: Colors.amberAccent),),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Icon(Icons.menu,size: 30,color: Colors.grey,),
                    )
                  ],
                ),
              ),
            ),



          ]
      ),
    );
  }
}


class ScrollLoopAuto extends StatelessWidget {


  ScrollLoopAuto({super.key});

  @override
  Widget build(BuildContext context)
  {
    return ScrollLoopAutoScroll(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              child: Image.asset('assets/images/6.png' ),),
            Container(
              height: 350,
              child: Image.asset('assets/images/10.png' ),),
            Container(
              height: 350,
              child: Image.asset('assets/images/15.png' ),),
            Container(
              height: 350,
              child: Image.asset('assets/images/9.png' ),),

          ],
        ),//required
        scrollDirection: Axis.horizontal, //required
        delay: Duration(seconds: 1),
        duration: Duration(seconds: 30),
        gap: 0,
        reverseScroll: true,
        duplicateChild : 2,
        enableScrollInput : true,
        delayAfterScrollInput : Duration(seconds: 1)
    );
  }
}