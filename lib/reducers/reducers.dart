import 'package:built_redux/built_redux.dart';
import 'package:passphrase_generator/actions/actions.dart';
import 'package:passphrase_generator/models/models.dart';

var reducerBuilder = ReducerBuilder<AppState, AppStateBuilder>()..add(AppActionsNames.increment, increment);

void increment(AppState state, Action<Null> action, AppStateBuilder builder) {
  builder.count++;
}
