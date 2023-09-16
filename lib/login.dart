import 'package:bestasangam/login/gmailpage.dart';
import 'package:bestasangam/login/phonenumber.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
          children: [
            const SizedBox(height: 100,),
            Column(
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
                    const SizedBox(height: 50,),
                     const Text(" Hi There..! Welcome ",style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold,
                      color:Color(0xFF0D47A1),
                    ),),
                    const SizedBox(height: 30,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 3,left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height:50,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>   PhoneLogin()));
                      },
                      color: const Color(0xFF0D47A1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)
                      ),
                      child: const Text("Login with Mobile Number",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 3,left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height:50,
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => const GoogleSignInPage()));
                      },
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)
                      ),
                      child: const Text("Sign Up With Google",style: TextStyle(
                          fontSize: 15,color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 150),
            Container(
              alignment: Alignment.bottomCenter,
              child: const Text('  from \n B.M.H.',
                style: TextStyle(fontSize: 15, color: Colors.blueGrey,fontWeight: FontWeight.bold,),
              ),
            ),
              ],
            ),
    ),
      ),
    );
  }
}


