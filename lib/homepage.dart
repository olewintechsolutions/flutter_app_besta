import 'package:bestasangam/matches.dart';
import 'package:bestasangam/members.dart';
import 'package:bestasangam/settings.dart';
import 'package:bestasangam/shortlisted.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {

 final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
 final user = FirebaseAuth.instance.currentUser!;

  Homepage(user, {super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {

  onTap(int index) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return tabs[_currentIndex];
    }));}

  final  tabs = [
    const MatchesPage(),
    const ShortlistPage(),
    const MembersPage(),
    const SettingsPage(),
  ];

  int _currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 25,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF0D47A1),
            icon: Icon(Icons.safety_divider),
            label: ('Matches'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: ('Shortlisted'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.person_pin),
            label: ('Members'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.settings_rounded),
            label:('Settings'),
          ),
        ],
        onTap: (index) {
        setState(() {
       _currentIndex = index;
        }); }
      ),
    );
  }
}