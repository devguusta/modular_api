import 'package:mobx/mobx.dart';

import 'package:navigation_args/app/modules/comments/comments_repository.dart';
import 'package:navigation_args/app/shared/models/comments_model.dart';

part 'comments_store.g.dart';

class CommentsStore = _CommentsStoreBase with _$CommentsStore;
abstract class _CommentsStoreBase with Store {
  final CommentsRepository repository;
  

  @observable
  bool isLoading = false;
  _CommentsStoreBase({
    required this.repository,

  });

  @action
  void setLoading(bool value) => isLoading = value;

  Future<List<CommentsModel?>?> getComments() async {
    setLoading(true);
    try {
      return repository.getComments();
    } catch (e){
     throw e;
    } finally {
      setLoading(false);
    }
  }
}
