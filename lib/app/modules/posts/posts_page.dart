import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:navigation_args/app/modules/posts/posts_store.dart';
import 'package:flutter/material.dart';
import 'package:navigation_args/app/shared/models/posts_model.dart';

class PostsPage extends StatefulWidget {
  final String title;
  const PostsPage({Key? key, this.title = 'PostsPage'}) : super(key: key);
  @override
  PostsPageState createState() => PostsPageState();
}

class PostsPageState extends State<PostsPage> {
  final PostsStore store = Modular.get();
  late Future<List<PostsModel?>?> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = store.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        return store.isLoading
            ? Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        FutureBuilder<List<PostsModel?>?>(
                            future: store.getPosts(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Text("Erro ao buscar os dados");
                              } else if(snapshot.hasData) {
                                final list = snapshot.data ?? [];
                                return list.length > 0 ?
                                ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: 30,
                                  itemBuilder: (_,index) => ListTile(
                                    title: Text('Title: ${list[index]!.title}'),
                                    subtitle: Text('Body: ${list[index]!.body}'),
                                  ),
                                  ) : Center(child: Text("Não há transações no momento"));
                              }  else {
                                return Container();
                              }
                            } 
                            ),
                      ],
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
