import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learn_redux/actions.dart';
import 'package:learn_redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:learn_redux/reducer.dart';
import 'package:learn_redux/middleware.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Store<AppState> store =
      Store(reducer, initialState: AppState(0), middleware: [middleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Larn Redux'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              StoreConnector(
                converter: (Store<AppState> store) => store.state.counter,
                builder: (context, counter) => Text(
                      '$counter',
                      style: Theme.of(context).textTheme.display1,
                    ),
              ),
            ],
          ),
        ),
        floatingActionButton: StoreConnector(
          converter: (Store<AppState> store) {
            return () => store.dispatch(Actions.Increment);
          },
          builder: (context, callback) => FloatingActionButton(
                onPressed: callback,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
        ),
      ),
    );
  }
}
