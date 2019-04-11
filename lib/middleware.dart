import 'package:learn_redux/actions.dart';
import 'package:learn_redux/app_state.dart';
import 'package:redux/redux.dart';

void middleware(Store<AppState> store, action, NextDispatcher next) async {
  print('run: $action');
  if (action == Actions.Increment) {
    print("current counter: ${store.state.counter}");
  }
  next(action);
  if (action == Actions.Increment) {
    print("updated counter: ${store.state.counter}");
  }
}
