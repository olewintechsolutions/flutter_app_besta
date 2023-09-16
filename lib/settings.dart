import 'package:bestasangam/homepage.dart';
import 'package:bestasangam/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);


  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
class _SettingsPageState extends State<SettingsPage> {
  bool valNotify1 = true;
  bool valNotify2 = false;

  onchangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onchangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xFF0D47A1),
        title: const Text(' Settings', style: TextStyle(fontSize: 20, color:Colors.white)),
        leading: IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
        },
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size: 18,)),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            Row(
              children: const [
                Icon(Icons.person, color: Colors.blueAccent,),
                SizedBox(height: 10,),
                Text('Account', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
              ],
            ),
            const Divider(height: 15, thickness: 3,),
            const SizedBox(height: 10,),

            buildAccountOption(context, "Profile"),
            const Divider(height: 12, thickness: 3,),
            buildAccountOption(context, "Privacy"),
            const Divider(height: 12, thickness: 3,),
            buildAccountOption(context, "Settings"),
            const Divider(height: 12, thickness: 3,),
            buildAccountOption(context, "License Agreement"),
            const Divider(height: 12, thickness: 3,),
            buildAccountOption(context, "Feedback"),
            const Divider(height: 12, thickness: 3,),
            buildAccountOption(context, "About Us"),
            const Divider(height: 12, thickness: 3,),
            const SizedBox(height: 10,),
            Row(
              children: const [
                Icon(Icons.notification_add_rounded, size: 20, color: Colors.blue,),
                SizedBox(height: 10,),
                Text("Notifications",
                  style: TextStyle(fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),)
              ],
            ),
            const Divider(height: 15, thickness: 3),
            const SizedBox(height: 10,),
            buildNotificationOption("Account Account ", valNotify1, onchangeFunction1),
            buildNotificationOption("Sound", valNotify2, onchangeFunction2),
            const SizedBox(height: 10,),
            Center(
                child: MaterialButton(
                  minWidth: double.infinity,
                  height:40,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const LoginScreen()));
                  },
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35)
                  ),
                    child:const Text("Sign Out",style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2.1,
                      color: Colors.white,
                    ),
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
  Padding buildNotificationOption( String title, bool value, Function onChangeMethod) {
    return Padding(padding:
    const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black,
        ),
        ),
        Transform.scale( scale: 0.7,
        child: CupertinoSwitch(
          activeColor: Colors.blueAccent,
          trackColor: Colors.grey,
          value: value, onChanged: (bool newValue ){
            onChangeMethod(newValue);
        },
        ),
        ),
      ],
    ),
    );
  }
  GestureDetector buildAccountOption(BuildContext context, String title ){
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context ){
          return AlertDialog(
            title: const Text("data"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("option -1"),
                Text("option -2"),
                Text("option -3"),
                Text("option -4"),
                Text("option -5"),
              ],
            ),
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            ),
            const Icon(Icons.arrow_forward, color: Colors.black, size: 15,
            //onTap(){},
            ),
          ],
        ),
      ),
    );
  }
}