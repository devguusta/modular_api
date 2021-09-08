import 'package:flutter_test/flutter_test.dart';
import 'package:navigation_args/app/modules/comments/comments_store.dart';
 
void main() {
  late CommentsStore store;

  setUpAll(() {
    store = CommentsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}