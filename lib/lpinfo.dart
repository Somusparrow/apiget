import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'boredd.dart';
import 'lpinfoo.dart';

class lpin extends StatefulWidget {
  const lpin({super.key});

  @override
  State<lpin> createState() => _lpinState();
}

class _lpinState extends State<lpin> {

  Future<lpinfo> boat() async{
    var result = await http.get(Uri.parse("https://ipinfo.io/161.185.160.93/geo"));
    return lpinfo.fromJson(jsonDecode(result.body));
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
                      Text(snapshot.data!.city.toString()),
                      Text(snapshot.data!.region.toString()),
                      Text(snapshot.data!.country.toString()),
                      Text(snapshot.data!.loc.toString()),
                      Text(snapshot.data!.org.toString()),
                      Text(snapshot.data!.postal.toString()),
                      Text(snapshot.data!.timezone.toString()),
                      Text(snapshot.data!.readme.toString()),
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
