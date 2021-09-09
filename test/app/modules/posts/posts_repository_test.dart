import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:navigation_args/app/modules/posts/posts_repository.dart';

import 'posts_repository_test.mocks.dart';
@GenerateMocks([http.Client])
void main() {
  var url = "https://jsonplaceholder.typicode.com/posts";
  PostsRepository repository = PostsRepository();
 group('fetchPosts', () { 
  
    test('Response Map started empty', (){
       expect(repository.responseMap, isEmpty);
     });
     test('Response map should has data', () async{
       expect(repository.responseMap, isEmpty);
       await repository.getPosts();
       if(repository.response.statusCode == 200){
         expect(repository.responseMap, isNotEmpty);
       } else {
         expect(repository.responseMap, isEmpty);
       }
     });
 });
}