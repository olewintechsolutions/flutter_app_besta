import 'package:flutter/material.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({Key? key}) : super(key: key);

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(height: 25,),
            const Text("Mobile Number Verification.....!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              width: 40,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
    ],
    ),
      );
  }
}
