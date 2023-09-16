import 'package:bestasangam/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'gmailpage.dart';

class LoginSuccess extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser!;
  LoginSuccess({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData){
            return Homepage(user);
          } else if (snapshot.hasError){
            return const Center( child:
            Text ("Something Went Wrong.....!\n Please try after-some time...",
                style: TextStyle(fontSize: 15, color: Colors.red)));
          } else {return const GoogleSignInPage();}
        },
    ),
  );
}