import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'myip.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IP Checker"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<myip> (
          future: getIP(),
          builder: (context, snapshot) {
            final ipData = snapshot.data;
            if (snapshot.hasData) {
              return Text("IP : ${ipData.ip}\nCountry : ${ipData.country}\nCity : ${ipData.city}\nLatitude : ${ipData.lat}\nLongitude : ${ipData.lon}\nIPS : ${ipData.ips}\nOrg : ${ipData.org}\nIPS As : ${ipData.ips_as}");
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}
Future<myip> getIP() async{
  final url ="http://ip-api.com/json/";
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return myip.fromJson(jsonData);
  } else {
    throw Exception;
  }
}


