import 'package:flutter/material.dart';

class Chapter1 extends StatefulWidget {
  @override
  State<Chapter1> createState() => new Chapter1State();
}

class Chapter1State extends State<Chapter1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter 1'),
      ),
      body: Center(
        child: Text('Chapter 1'),
      ),
    );
  }
}
