import 'package:api/bored.dart';
import 'package:api/dogg.dart';
import 'package:api/genderize.dart';
import 'package:api/jokes.dart';
import 'package:api/lpify.dart';
import 'package:api/lpinfo.dart';
import 'package:api/nation.dart';
import 'package:flutter/material.dart';

import 'Api/catfact.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: joke(),
    );
  }
}

