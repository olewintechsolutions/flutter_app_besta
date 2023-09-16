import 'package:bestasangam/homepage.dart';
import 'package:bestasangam/login/phonenumber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../login.dart';

class VerificationPage extends StatefulWidget {

 final  String verificationId;

  const VerificationPage  ({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<VerificationPage > createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage > {

  final firebaseAuth = FirebaseAuth.instance;
  bool loading = false;
  final countryController = TextEditingController();
  final verify = TextEditingController();


  get user => null;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 55,
      height: 65,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(164, 178, 234, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(210, 230, 243, 1),
      ),
    );
    var code ="";
    return Scaffold(

      extendBodyBehindAppBar: true,
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const Text(
                "OTP Verification Page.....!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "OTP has been sent Successfully to your Mobile Number",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                color: Colors.green),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                 defaultPinTheme: defaultPinTheme,
                 focusedPinTheme: focusedPinTheme,
                 submittedPinTheme: submittedPinTheme,
                onChanged: (value) {
                  code = value;
                },
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                       backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: ()  async {

                      final credential  = PhoneAuthProvider.credential(
                          verificationId: PhoneLogin.verify,
                          smsCode: code.toString());

                      try{
                        await firebaseAuth.signInWithCredential(credential);
                      } catch (e){
                        print("PIN InCorrect ");
                      }

                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>    Homepage(user)));

                    },
                    child: const Text("Verify OTP Code",style: TextStyle(
                      fontSize: 15,color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
              ),
              const SizedBox(height: 30,),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) =>    const LoginScreen()));
                      },
                      child: const Text(
                        "Edit Your Mobile Number...!",
                        style: TextStyle(color: Colors.redAccent,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text('  from \n B.M.H.',
                  style: TextStyle(fontSize: 15,
                      color: Colors.blueGrey,
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
