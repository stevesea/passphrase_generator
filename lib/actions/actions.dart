library actions;

import 'package:built_redux/built_redux.dart';

part 'actions.g.dart';

abstract class AppActions extends ReduxActions {
  factory AppActions() => new _$AppActions();
  AppActions._();

  ActionDispatcher<Null> get increment;
  ActionDispatcher<Null> get decrement;
  ActionDispatcher<int> get set_num_words;
}
