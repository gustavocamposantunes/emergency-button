class Counter {
  Counter({int initialValue = 0}) : _value = initialValue;

  int _value;

  int get value => _value;

  void increment() {
    _value += 1;
  }

  void decrement() {
    _value -= 1;
  }

  void reset() {
    _value = 0;
  }
}