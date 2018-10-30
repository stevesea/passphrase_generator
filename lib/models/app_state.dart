library app_state;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;

  AppState._();

  int get num_words;

  factory AppState([updates(AppStateBuilder b)]) => _$AppState((b) => b
    ..num_words = 6
    ..update(updates));
}
