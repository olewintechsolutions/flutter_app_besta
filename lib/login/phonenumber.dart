import 'package:bestasangam/login/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin ({Key? key}) : super(key: key);

  static String verify ="";
  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {

  final firebaseAuth = FirebaseAuth.instance;

  bool  loading = true;
  final countryController = TextEditingController();
  final verify = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  var phonenumber = "";
  var SmsCode = "";
  var timeout = "";

  get user => null;

  @override
  Widget build(BuildContext context) {
    var code = "";
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25,),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25), // Image border
                  child: Image.asset('assets/images/icon.png',
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text("Mobile Number Verification.....!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          code = value;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Mobile Number",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),

                    onPressed: () async {

                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+91 ${countryController.text + phonenumber}',
                        verificationCompleted: (PhoneAuthCredential credential) {

                        },
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          PhoneLogin.verify = verificationId;
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => VerificationPage(verificationId: PhoneLogin.verify,)
                      ));
                    },
                  child: const Text ("Send OTP code",
                    style: TextStyle(fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text('  from \n B.M.H.',
                  style: TextStyle(fontSize: 15,
                      color: Colors.blueGrey,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}