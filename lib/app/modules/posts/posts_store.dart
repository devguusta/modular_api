import 'package:mobx/mobx.dart';

part 'posts_store.g.dart';

class PostsStore = _PostsStoreBase with _$PostsStore;
abstract class _PostsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}