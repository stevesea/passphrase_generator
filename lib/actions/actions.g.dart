// GENERATED CODE - DO NOT MODIFY BY HAND

part of actions;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$AppActions extends AppActions {
  factory _$AppActions() => new _$AppActions._();
  _$AppActions._() : super._();

  final ActionDispatcher<Null> increment =
      new ActionDispatcher<Null>('AppActions-increment');
  final ActionDispatcher<Null> decrement =
      new ActionDispatcher<Null>('AppActions-decrement');
  final ActionDispatcher<int> set_num_words =
      new ActionDispatcher<int>('AppActions-set_num_words');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    increment.setDispatcher(dispatcher);
    decrement.setDispatcher(dispatcher);
    set_num_words.setDispatcher(dispatcher);
  }
}

class AppActionsNames {
  static final ActionName<Null> increment =
      new ActionName<Null>('AppActions-increment');
  static final ActionName<Null> decrement =
      new ActionName<Null>('AppActions-decrement');
  static final ActionName<int> set_num_words =
      new ActionName<int>('AppActions-set_num_words');
}
