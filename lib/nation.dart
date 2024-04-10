import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'nationalize.dart';

class nation extends StatefulWidget {
  const nation({super.key});

  @override
  State<nation> createState() => _nationState();
}

class _nationState extends State<nation> {

  Future< nationalize> cat() async{
    var result = await http.get(Uri.parse("https://api.genderize.io?name=luc"));
    return  nationalize.fromJson(jsonDecode(result.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future:cat(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text(snapshot.data!.count.toString()),
                      Text(snapshot.data!.name.toString()),
                      Text(snapshot.data!.country.toString()),
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
