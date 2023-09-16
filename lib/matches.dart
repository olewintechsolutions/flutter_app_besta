import 'package:bestasangam/chatpageui.dart';
import 'package:flutter/material.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({Key? key}) : super(key: key);

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xFF0D47A1),
        title: const Text('Matches', style: TextStyle(fontSize: 15, color:Colors.white),),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.chat,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
              // do something
            },
          )
        ],
      ),
      body: SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
          Container(
            height: 5,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(35)),
            child: const Center(child: Text('Recently Viewed', style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold),)),

          ),
            Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(35)),
              child: const Center(child: Text('Recently Viewed', style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold),)),

            ),
            Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(35)),
              child: const Center(child: Text('Recently Viewed', style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold),)),

            ),
            Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(35)),
              child: const Center(child: Text('Recently Viewed', style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold),)),

            ),
            Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(35)),
              child: const Center(child: Text('Recently Viewed', style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold),)),

            ),
            Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(35)),
              child: const Center(child: Text('Recently Viewed', style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold),)),

            ),
            Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(35)),
              child: const Center(child: Text('Recently Viewed', style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold),)),

            ),
            Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(35)),
              child: const Center(child: Text('Recently Viewed', style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold),)),

            ),
            Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(35)),
              child: const Center(child: Text('Recently Viewed', style: TextStyle(fontSize: 12, color: Colors.white,fontWeight: FontWeight.bold),)),

            ),

          ],
        )
        ),
    );
  }
}
