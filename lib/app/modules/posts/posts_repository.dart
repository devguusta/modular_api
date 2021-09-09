import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:navigation_args/app/shared/models/posts_model.dart';

class PostsRepository {
  var dio = Dio();
   final baseURL = "http://jsonplaceholder.typicode.com";
   Future<List<PostsModel>?> getPosts() async {
     var url = Uri.parse('$baseURL/posts');
     final response = await http.get(url);
     if(response.statusCode == 200) {
       final List<dynamic> responseMap = jsonDecode(response.body);
       return responseMap.map((post) => PostsModel.fromMap(post)).toList();
     } else {
       print(response.statusCode);
       return null;
     }
   }

}