import 'package:meta/meta.dart';

@immutable
class AppState {
  AppState(this.counter);
  final int counter;
}
