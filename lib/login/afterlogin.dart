import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AfterLoginSuccess extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('BestaSangam', style:TextStyle(
          fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.green[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Logged In Successfully.....", style:TextStyle(
              fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 15,),
            CircleAvatar(
              radius: 50,
              // backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 10,),
            //Text("UserName:" + user.displayName!, style:TextStyle(fontSize: 15, color: Colors.blue,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10,),
            //Text("Gmail ID:" + user.email!, style:TextStyle(fontSize: 15, color: Colors.blue,fontWeight: FontWeight.bold,),),
          ],
        ),
      ),
    );
  }
}