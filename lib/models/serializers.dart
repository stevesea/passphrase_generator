// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

library serializers;

import 'package:built_value/serializer.dart';
import 'package:passphrase_generator/models/models.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AppState,
])
final Serializers serializers = _$serializers;
