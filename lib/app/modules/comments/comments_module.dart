import 'package:navigation_args/app/modules/comments/comments_Page.dart';
import 'package:navigation_args/app/modules/comments/comments_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'comments_repository.dart';

class CommentsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CommentsStore(repository: CommentsRepository())),
    Bind.singleton((i) => CommentsRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CommentsPage()),
  ];
}
