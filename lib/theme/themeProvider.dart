import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

var isLight = StateProvider((ref) => true);

void toogleTheme(WidgetRef ref) {
  ref.watch(isLight.notifier).update((state) => !state);
}
