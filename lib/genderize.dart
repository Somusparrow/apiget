import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'genderizee.dart';

class genapi extends StatefulWidget {
  const genapi({super.key});

  @override
  State<genapi> createState() => _genapiState();
}

class _genapiState extends State<genapi> {

  Future<genderize> fetchdata() async{
    var result = await http.get(Uri.parse("https://api.genderize.io?name=luc"));
    return genderize.fromJson(jsonDecode(result.body));
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
                      Text(snapshot.data!.count.toString()),
                      Text(snapshot.data!.name.toString()),
                      Text(snapshot.data!.gender.toString()),
                      Text(snapshot.data!.probability.toString()),
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
