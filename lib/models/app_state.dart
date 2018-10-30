library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;

  AppState._();

  int get num_words;

  BuiltList<String> get results;

  factory AppState([updates(AppStateBuilder b)]) => _$AppState((b) => b
    ..num_words = 6
    ..results = ListBuilder<String>(['one thing', 'two thing'])
    ..update(updates));
}
