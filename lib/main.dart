import 'dart:async';
import 'package:bestasangam/homepage.dart';
import 'package:bestasangam/login.dart';
import 'package:bestasangam/login/gmailpage.dart';
import 'package:bestasangam/login/phonenumber.dart';
import 'package:bestasangam/login/verify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  
 static final  String title = "HomePage";

  get user => null;

  @override
  Widget build(BuildContext context)   => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
     child:  MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner:false,
       initialRoute:'/',
       routes:{
         '/': (context) => const LogoPage(),
         'LogoPage' :(context) => const LoginScreen(),
         'verify' :(context) => const VerificationPage(verificationId: 'PhoneLogin.verify'),
         'homepage': (context) =>  Homepage(user),


       },
    ),
 );
}


class LogoPage extends StatefulWidget {

  const LogoPage ({super.key});

  @override
  _LogoscreenPage createState() => _LogoscreenPage();
}
class _LogoscreenPage extends State<LogoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2),() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) =>    const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        const SizedBox(height: 25,),
        Scaffold(
          backgroundColor: Colors.white,
          body: Column(
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
                height: 250,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text('  from \n B.M.H.',
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
      ]
    );
  }
}