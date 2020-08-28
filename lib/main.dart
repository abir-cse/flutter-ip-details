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
            final List<String> entries = <String>["IP : "+ipData.ip,"Country : "+ipData.country, "City : "+ipData.city, "Latitude : "+ipData.lat.toString(), "Longitude : "+ipData.lon.toString(), "ISP : "+ipData.isp.toString(), "Org : "+ipData.org.toString(), ];
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.black12,
                      child: Center(child: Text(
                          '${entries[index]}',
                      )),
                    );
                  }
              );
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