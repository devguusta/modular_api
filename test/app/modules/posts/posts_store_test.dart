import 'package:flutter_test/flutter_test.dart';
import 'package:navigation_args/app/modules/posts/posts_store.dart';
 
void main() {
  late PostsStore store;

  setUpAll(() {
    store = PostsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}