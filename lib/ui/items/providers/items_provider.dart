

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/item.dart';
import '../../../core/repositories/item_repository_provider.dart';

final itemsProvider = StreamProvider<List<Item>>(
  (ref) => ref.read(itemRepositoryProvider).itemsStream,
);
