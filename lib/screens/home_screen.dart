import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asdfasdf'),
      ),
      body: Column(children: [Text('asdf')]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('fab pressed!');
        },
        child: Icon(Icons.shuffle),
        tooltip: 'generate',
      ),
    );
  }
}
