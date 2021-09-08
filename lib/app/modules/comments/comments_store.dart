import 'package:mobx/mobx.dart';

part 'comments_store.g.dart';

class CommentsStore = _CommentsStoreBase with _$CommentsStore;
abstract class _CommentsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}