import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

var currentValue = StateProvider<int>((ref) => 0);
void jumpTo(WidgetRef ref, int to) {
  ref.read(currentValue.notifier).update((state) => to);
}
