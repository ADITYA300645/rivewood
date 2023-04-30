import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var currentImageIndexProvider = StateProvider((ref) => 0);

imagePageHandler(WidgetRef ref, int n) {
  ref.watch(currentImageIndexProvider.notifier).update((state) {
    return n;
  });
}

var pageController = PageController();
