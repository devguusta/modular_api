import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:navigation_args/app/modules/home/home_store.dart';


class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){
              Modular.to.pushNamed('/comments');
            },
            child: Text('comments'),
          ),
          ElevatedButton(
        onPressed: (){
          Modular.to.pushNamed('/posts');
        },
        child: Text('posts'),
      ),
        ],
      ),
       
    );
  }
}