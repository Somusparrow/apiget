import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'boredd.dart';
import 'lpifyy.dart';

class lpi extends StatefulWidget {
  const lpi({super.key});

  @override
  State<lpi> createState() => _lpiState();
}

class _lpiState extends State<lpi> {

  Future<lpify> boat() async{
    var result = await http.get(Uri.parse("https://api.ipify.org?format=json"));
    return lpify.fromJson(jsonDecode(result.body));
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
                      Text(snapshot.data!.ip.toString()),
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
