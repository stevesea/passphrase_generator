library example;

import 'package:built_redux/built_redux.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:passphrase_generator/actions/actions.dart';
import 'package:passphrase_generator/middleware//middleware.dart';
import 'package:passphrase_generator/models/models.dart';
import 'package:passphrase_generator/reducers/reducers.dart';

part 'main.g.dart';

void main() {
  // create the store
  final store =
      new Store<AppState, AppStateBuilder, AppActions>(reducerBuilder.build(), AppState(), AppActions(), middleware: [
    createMiddleware(),
  ]);

  runApp(new ConnectionExample(store));
  // or comment the line above and uncomment the line below
  // runApp(new ConnectorExample(store));
}

class PassphraseApp extends StatefulWidget {
  final store = Store<AppState, AppStateBuilder, AppActions>();

  @override
  State<StatefulWidget> createState() {
    return PassphraseAppState();
  }
}

class PassphraseAppState extends State<PassphraseApp> {
  Store<AppState, AppStateBuilder, AppActions> store;

  PassphraseAppState() {}

  @override
  void initState() {
    store = widget.store;

    //store.actions.fetchTodosAction();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReduxProvider(
      store: store,
      child: MaterialApp(
        title: 'asdf',
        routes: {
          '/': (context) {
            return HomeScreen(key: ArchSampleKeys.homeScreen);
          },
        },
      ),
    );
  }
}
