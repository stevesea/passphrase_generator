library middleware;

import 'package:built_redux/built_redux.dart';
import 'package:passphrase_generator/actions/actions.dart';
import 'package:passphrase_generator/models/models.dart';

Middleware<AppState, AppStateBuilder, AppActions> createMiddleware() {
  return (MiddlewareBuilder<AppState, AppStateBuilder, AppActions>()..add(AppActionsNames.increment, increment()))
      .build();
}

MiddlewareHandler<AppState, AppStateBuilder, AppActions, Null> increment() {
  return (MiddlewareApi<AppState, AppStateBuilder, AppActions> api, ActionHandler next, Action<Null> action) {
    next(action);
  };
}
