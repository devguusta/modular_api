import 'package:mobx/mobx.dart';
import 'package:navigation_args/app/shared/models/posts_model.dart';

import 'posts_repository.dart';

part 'posts_store.g.dart';

class PostsStore = _PostsStoreBase with _$PostsStore;
abstract class _PostsStoreBase with Store {
  final PostsRepository repository;
 
  _PostsStoreBase({
    required this.repository,
  });
  @observable
  bool isLoading = false;
  @action
  void setLoading(bool value) => isLoading = value;

  Future<List<PostsModel?>?> getPosts() async {
    setLoading(true);
    try {
      return repository.getPosts();
    } catch (e) {
      throw e;
    } finally {
      setLoading(false);
    }
  }

  
}
