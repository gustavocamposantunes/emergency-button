import 'package:flutter_test/flutter_test.dart';

import 'package:emergency_button/counter.dart';

void main() {
  group('Counter', () {
    test('starts at the provided initial value', () {
      final counter = Counter(initialValue: 5);

      expect(counter.value, 5);
    });

    test('increments the value', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('resets the value to zero', () {
      final counter = Counter(initialValue: 3);

      counter.reset();

      expect(counter.value, 0);
    });
  });
}