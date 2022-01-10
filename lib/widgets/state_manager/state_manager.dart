class StateManager<T> {
  StateManager({required T initialState}) {
    _state = initialState;
  }

  late T _state;
  final _listeners = <Function>[];

  T get state => _state;

  void _update() {
    for (var i = 0; i < _listeners.length; i++) {
      _listeners[i](_state);
    }
  }

  void setState(T state) {
    _state = state;
    _update();
  }

  void listen(void Function(T state) onUpdate) {
    _listeners.add(onUpdate);
  }
}
