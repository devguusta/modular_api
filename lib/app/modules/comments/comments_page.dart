import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:navigation_args/app/modules/comments/comments_store.dart';
import 'package:flutter/material.dart';
import 'package:navigation_args/app/shared/models/comments_model.dart';

class CommentsPage extends StatefulWidget {
  final String title;
  const CommentsPage({Key? key, this.title = 'CommentsPage'}) : super(key: key);
  @override
  CommentsPageState createState() => CommentsPageState();
}
class CommentsPageState extends ModularState<CommentsPage,CommentsStore> {
  final CommentsStore store = Modular.get();
  late Future<List<CommentsModel?>?> futureComments;
  @override
  void initState() {
    futureComments = store.getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
          return store.isLoading ? Center(child: CircularProgressIndicator()) : Column(
          children: <Widget>[
           FutureBuilder<List<CommentsModel?>?>(
             future: store.getComments(),
             builder:(context,snapshot){
              
               print(snapshot.data);
               if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Erro ao buscar os dados");
             } else if(snapshot.hasData) {
               final list = snapshot.data ?? [];
               return list.length > 0 ? 
               Container(
                 child: Column(
                   children: [
                     ListView.builder(
                       physics: NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       primary: false,
                       itemCount: 50,
                     itemBuilder: (_,index) => ListTile(
                       title: Text(list[index]!.email),
                       subtitle: Text(list[index]!.name),
                     ),
                       
                       ),
                   ],
                 ),
               ) : Center(child: Text("Não há transações no momento"));
             } else {
              return Container();
             }
             }
             ),
          ],
        );
        }
       
      ),
    );
  }
}