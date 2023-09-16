import 'package:bestasangam/chatpageui.dart';
import 'package:flutter/material.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xFF0D47A1),
        title: const Text(' Sangam Members', style: TextStyle(fontSize: 15, color:Colors.white),),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.voice_chat_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
              // do something
            },
          )
        ],
      ),

      body: Center(
        child: Text('Members page-3'),
      ),
    );
  }
}
