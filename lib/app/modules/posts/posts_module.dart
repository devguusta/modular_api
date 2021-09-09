import 'package:navigation_args/app/modules/posts/posts_Page.dart';
import 'package:navigation_args/app/modules/posts/posts_repository.dart';
import 'package:navigation_args/app/modules/posts/posts_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PostsStore(repository: PostsRepository())),
    Bind.singleton((i) =>PostsRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PostsPage()),
  ];
}
