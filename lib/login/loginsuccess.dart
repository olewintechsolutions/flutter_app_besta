import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'verify.dart';


class LoggedInSuccess extends StatelessWidget {

 final  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(" You have Logged In Successfully",
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20, color: Colors.green),),
            const SizedBox(height: 16,),
            Text("${firebaseAuth.signInWithPhoneNumber}", style: const TextStyle(color: Colors.grey, ),),
          ],
        ),
      ),
    );
  }
}
