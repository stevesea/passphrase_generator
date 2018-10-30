import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:passphrase_generator/actions/actions.dart';
import 'package:passphrase_generator/models/models.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passphrase Generator'),
      ),
      body: ResultsList(),
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

class ResultsList extends StoreConnector<AppState, AppActions, List<String>> {
  final List<String> results;

  ResultsList({Key key, @required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context, List<String> results, AppActions actions) {
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(results[index]));
        });
  }

  @override
  List<String> connect(AppState state) => state.results.toList();
}
