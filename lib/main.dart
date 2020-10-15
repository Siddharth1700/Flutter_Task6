import 'package:animation_app/ui/animation.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
MyApp() {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: MyAnimation(),
    ),
  );
}

void main() {
  runApp(MyApp());
}
