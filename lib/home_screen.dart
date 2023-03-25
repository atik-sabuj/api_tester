import 'dart:convert';

import 'package:api_tester/models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }else {
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Tester'),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
