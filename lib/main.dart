import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starbucks/views/homepage.dart';

void main() {
  runApp(GetMaterialApp(home:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Homepage(),
    );
  }
}

