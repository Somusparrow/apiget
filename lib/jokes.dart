import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'boredd.dart';
import 'jokess.dart';

class joke extends StatefulWidget {
  const joke({super.key});

  @override
  State<joke> createState() => _jokeState();
}

class _jokeState extends State<joke> {

  Future<jokes> boat() async{
    var result = await http.get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));
    return jokes.fromJson(jsonDecode(result.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future:boat(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.type.toString()),
                      Text(snapshot.data!.setup.toString()),
                      Text(snapshot.data!.punchline.toString()),
                      Text(snapshot.data!.id.toString()),
                    ],
                  );
                } else if(snapshot.hasError){
                  return Text("error");
                } return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}
