import 'package:flutter_modular/flutter_modular.dart';

import 'modules/comments/comments_module.dart';
import 'modules/home/home_module.dart';
import 'modules/posts/posts_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/posts', module: PostsModule()),
    ModuleRoute('/comments', module: CommentsModule()),
  ];

}