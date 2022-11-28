import 'package:flutter/material.dart';
import 'package:flutter_quizapplication_1/quiz_screen.dart';
import 'package:flutter_quizapplication_1/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz App',
      theme: ThemeData.dark(),
      home: MyCustomUI(),
    );
  }
}
