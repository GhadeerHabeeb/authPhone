import 'package:firebase_auth/firebase_auth.dart';
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
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo.png',
                width: 250,
                height: 250,
              ),

              SizedBox(
                height: 25,
              ),
              Text(
                "أدخل رقم هاتفك",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                " SMS لكي نرسل لك الكود في رسالة  ",
                style: TextStyle(
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
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
                    SizedBox(
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
                    SizedBox(
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "هاتف",
                            hintStyle: TextStyle(fontSize: 25)
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        textStyle: TextStyle(fontSize: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: ()    {
                      print('phone:'+phone);
setState(() {
  _phoneAuth();
});

                    },
                    child: Text("ارسال")),
              )
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
}