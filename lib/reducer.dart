import 'package:learn_redux/actions.dart';
import 'package:learn_redux/app_state.dart';

AppState reducer(AppState prev, action) {
  if (action == Actions.Increment) {
    return AppState(prev.counter + 1);
  }
  return prev;
}
