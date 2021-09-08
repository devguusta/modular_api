import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:navigation_args/app/shared/models/comments_model.dart';

class CommentsRepository {
  var dio = Dio();
  final baseURL = "http://jsonplaceholder.typicode.com";
  Future<List<CommentsModel>> getComments() async {
    var url = Uri.parse('$baseURL/comments');
    final response = await http.get(url);
    final List<dynamic> responseMap = jsonDecode(response.body);
    // print(responseMap);
    // // print(response.data.length);
    return responseMap.map<CommentsModel>((resp)=> CommentsModel.fromMap(resp)).toList();
  }
}