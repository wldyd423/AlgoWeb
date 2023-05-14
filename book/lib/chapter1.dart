import 'package:flutter/material.dart';
import 'dart:math';

class ShakeCurve extends Curve {
  @override
  double transform(double t) {
    return sin(t * pi * 2);
  }
}

class Chapter1 extends StatefulWidget {
  @override
  State<Chapter1> createState() => Chapter1State();
}

class Chapter1State extends State<Chapter1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insertion Sort'),
      ),
      body: Row(
        children: [
          Text("Hello World"),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 300,
            width: 300,
            child: FlutterLogo(),
            //https://docs.flutter.dev/development/ui/animations/tutorial
          )
        ],
      ),
    );
  }
}
