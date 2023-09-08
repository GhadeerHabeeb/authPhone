
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPhone extends StatefulWidget {
  static String verify="";
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  var phone='';
  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+964";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 250,
                height: 250,
              ),

              const SizedBox(
                height: 25,
              ),
              const Text(
                "أدخل رقم هاتفك",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                " SMS لكي نرسل لك الكود في رسالة  ",
                style: TextStyle(
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                   /* SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),*/
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                          onChanged: (value){
                            setState(() {
                              phone=value;
                            });
                          },
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "هاتف",
                            hintStyle: TextStyle(fontSize: 25)
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        textStyle: const TextStyle(fontSize: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: ()    {
                      print('phone:'+phone);

  if(phone=='')
    {
      _showAlertDialog(context);
      print('please enter phone num');
    }
  else
  {
    _phoneAuth();
  }


                    },
                    child: const Text("ارسال")),
              ),

            ],
          ),
        ),
      ),
    );
  }
  _phoneAuth()
  async {
    try{
      print(countryController.text+phone);
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${countryController.text+phone}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          MyPhone.verify=verificationId;
          Navigator.pushNamed(context, 'verify');
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }
    catch(ex){
      print(ex);
    }
  }
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('تحذير',style: TextStyle(fontSize: 30),),
        content: const Text('ادخل رقم الهاتف',style: TextStyle(fontSize: 20),),
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
}