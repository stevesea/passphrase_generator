library example;

import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_built_redux/flutter_built_redux.dart';

part 'main.g.dart';

void main() {
  // create the store
  final store = new Store(
    reducerBuilder.build(),
    new Counter(),
    new CounterActions(),
  );

  runApp(new ConnectionExample(store));
  // or comment the line above and uncomment the line below
  // runApp(new ConnectorExample(store));
}

/// an example using `StoreConnection`
class ConnectionExample extends StatelessWidget {
  final Store<Counter, CounterBuilder, CounterActions> store;

  ConnectionExample(this.store);

  @override
  Widget build(BuildContext context) => new MaterialApp(
        title: 'flutter_built_redux_test',
        home: new ReduxProvider(
          store: store,
          child: new StoreConnection<Counter, CounterActions, int>(
            connect: (state) => state.count,
            builder: (BuildContext context, int count, CounterActions actions) {
              return new Scaffold(
                  appBar: AppBar(
                    title: Text("thingy"),
                    centerTitle: true,
                  ),
                  floatingActionButton: new FloatingActionButton(
                    onPressed: () => print("fab pressed"),
                    tooltip: 'generate',
                    child: new Icon(Icons.shuffle),
                  ),
                  body: Column(children: [
                    /*
                    Expanded(
                        child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(5.0),
                            crossAxisSpacing: 10.0,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10.0,
                            children: [5, 6, 7, 8, 9, 10, 11, 12]
                                .map((i) => RaisedButton(
                                    onPressed: () => print("1"),
                                    child: Row(children: [
                                      Padding(
                                        child: Icon(Icons.shuffle),
                                        padding: EdgeInsets.only(right: 5.0),
                                      ),
                                      Text("$i Words")
                                    ])))
                                .toList())),
                                */
                    Row(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: actions.increment,
                          child: Text('Increment'),
                        ),
                        Text('Count: $count'),
                      ],
                    ),
                  ]));
            },
          ),
        ),
      );
}

/// an example using a widget that implements `StoreConnector`
class ConnectorExample extends StatelessWidget {
  final Store<Counter, CounterBuilder, CounterActions> store;

  ConnectorExample(this.store);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'flutter_built_redux_test',
      home: new ReduxProvider(
        store: store,
        child: new CounterWidget(),
      ),
    );
  }
}

/// [CounterWidget] impelments [StoreConnector] manually
class CounterWidget extends StoreConnector<Counter, CounterActions, int> {
  CounterWidget();

  @override
  int connect(Counter state) => state.count;

  @override
  Widget build(BuildContext context, int count, CounterActions actions) => Scaffold(
          body: Column(children: [
        ButtonTheme.bar(
            child: ButtonBar(alignment: MainAxisAlignment.spaceBetween, children: [
          RaisedButton(onPressed: () => print("1"), child: Text("Gen1")),
          RaisedButton(onPressed: () => print("1"), child: Text("Gen2")),
          RaisedButton(onPressed: () => print("3"), child: Text("Gen3"))
        ])),
        Row(
          children: <Widget>[
            RaisedButton(
              onPressed: actions.increment,
              child: Text('Increment'),
            ),
            Text('Count: $count'),
            Text("test"),
          ],
        ),
      ]));
}

// Built redux counter state, actions, and reducer

ReducerBuilder<Counter, CounterBuilder> reducerBuilder = new ReducerBuilder<Counter, CounterBuilder>()
  ..add(CounterActionsNames.increment, (s, a, b) => b.count++);

abstract class CounterActions extends ReduxActions {
  factory CounterActions() => new _$CounterActions();
  CounterActions._();

  ActionDispatcher<Null> get increment;
}

abstract class Counter implements Built<Counter, CounterBuilder> {
  factory Counter() => new _$Counter._(count: 0);
  Counter._();

  int get count;
}
