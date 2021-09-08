import 'package:flutter_modular/flutter_modular.dart';
import 'package:navigation_args/app/modules/posts/posts_store.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  final String title;
  const PostsPage({Key? key, this.title = 'PostsPage'}) : super(key: key);
  @override
  PostsPageState createState() => PostsPageState();
}
class PostsPageState extends State<PostsPage> {
  final PostsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}