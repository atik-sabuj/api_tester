import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {

  List<Photos> photoList = [];
  
  Future<List<Photos>> getPhotos () async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200) {

    }else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Photo'),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

class Photos {
  String title, url;

  Photos({required this.title, required this.url});
}