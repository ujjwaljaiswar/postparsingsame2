import 'dart:convert';
import 'package:postparsingsame2/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<User> users = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("post method "),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {

            final asset_id = users[index];
            final asset_name = asset_id.asset_name;
            final access = asset_id.access;
            Color backgroundColor = access == 'Granted' ? Colors.green : Colors.red;


            return ListTile(
              tileColor: backgroundColor,
              title: Text(asset_name, style: TextStyle(color: Colors.white)),
              subtitle: Text(access, style: TextStyle(color: Colors.white)),
            );
          }
          ),


      floatingActionButton: FloatingActionButton(
        onPressed: PostData(),

      ),
    );
  }


 PostData()  {

    print("hello");

    Map data = {
      'yard_id':'3',
    };

    const url = 'https://rymsindia.com/app/yard-assets-list.php';
    final uri = Uri.parse(url);
    http.post(uri, body: data).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final parsedResponse = json.decode(response.body);

        if (parsedResponse is List) {
          final usersList = parsedResponse.map((data) => User.fromJson(data)).toList();

          setState(() {
            users = usersList;
          });
        }
      }
    });

    print("END");
  }

}
