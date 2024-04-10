import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'boredd.dart';

class boreed extends StatefulWidget {
  const boreed({super.key});

  @override
  State<boreed> createState() => _boreedState();
}

class _boreedState extends State<boreed> {

  Future<bored> boat() async{
    var result = await http.get(Uri.parse("https://www.boredapi.com/api/activity"));
    return bored.fromJson(jsonDecode(result.body));
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
                      Text(snapshot.data!.activity.toString()),
                      Text(snapshot.data!.type.toString()),
                      Text(snapshot.data!.participants.toString()),
                      Text(snapshot.data!.price.toString()),
                      Text(snapshot.data!.link.toString()),
                      Text(snapshot.data!.key.toString()),
                      Text(snapshot.data!.accessibility.toString()),
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
