import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'catfacts.dart';
import 'dogggg.dart';

class api extends StatefulWidget {
  const api({super.key});

  @override
  State<api> createState() => _apiState();
}

class _apiState extends State<api> {

  Future<cls> fetchdata() async{
    var result = await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
    return cls.fromJson(jsonDecode(result.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(future: fetchdata(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.message.toString()),
                      Text(snapshot.data!.status.toString()),
                      // Text(snapshot.data!.gender.toString()),
                      // Text(snapshot.data!.probability.toString()),
                      // Text(snapshot.data!.link.toString()),
                      // Text(snapshot.data!.key.toString()),
                      // Text(snapshot.data!.accessibility.toString()),
                    ],
                  );
                }
                else if(snapshot.hasError){
                  return Text('error');
                }return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}