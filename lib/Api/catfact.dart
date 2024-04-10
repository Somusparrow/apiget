import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../catfacts.dart';

class get_api extends StatefulWidget {
  const get_api({super.key});

  @override
  State<get_api> createState() => _get_apiState();
}

class _get_apiState extends State<get_api> {

  Future<catfact> fetchdata() async{
    var result = await http.get(Uri.parse("https://catfact.ninja/fact"));
    return catfact.fromJson(jsonDecode(result.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future:fetchdata(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.fact.toString()),
                      Text(snapshot.data!.length.toString()),
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
