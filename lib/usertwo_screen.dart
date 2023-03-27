import 'dart:convert';
import 'package:api_tester/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsertwoScreen extends StatefulWidget {
  const UsertwoScreen({Key? key}) : super(key: key);

  @override
  State<UsertwoScreen> createState() => _UsertwoScreenState();
}

class _UsertwoScreenState extends State<UsertwoScreen> {

  var data;
  Future<void> getUserApi () async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200){
      data = jsonDecode(response.body.toString());
    }else {

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Two Api'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserApi(),
            builder: (context, snapshot){

                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Text('Loading.....');
                  }else{
                    return ListView.builder(
                        itemBuilder: (context, index){
                          return Card(
                            child: Column(
                              children: [

                              ],
                            ),
                          );
                        });
                  }
            },
          ),
          )
        ],
      ),
    );
  }
}


class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
