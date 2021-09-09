import 'package:flutter_test/flutter_test.dart';
import 'package:navigation_args/app/modules/posts/posts_repository.dart';
import 'package:navigation_args/app/modules/posts/posts_store.dart';

void main() {
  var store =  PostsStore(repository: PostsRepository());
  //  setUp(() => store = PostsStore(repository: PostsRepository()));

   group('Posts Store', () { 
     test('Store.loading should start false', (){
       expect(store.isLoading, false);
     });
     test('store.loading should change', () async{
       expect(store.isLoading,false);
       store.setLoading(true);
       expect(store.isLoading, true);
     });
   });
}