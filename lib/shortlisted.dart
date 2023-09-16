import 'package:flutter/material.dart';

class ShortlistPage extends StatefulWidget {
  const ShortlistPage({Key? key}) : super(key: key);

  @override
  State<ShortlistPage> createState() => _ShortlistPageState();
}

class _ShortlistPageState extends State<ShortlistPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xFF0D47A1),
        title: const Text('Shortlisted', style: TextStyle(fontSize: 15, color:Colors.white),),
      ),
      body: Center(
        child: Text('shortlist page-2'),
      ),
    );
  }
}
