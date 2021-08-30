import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class StreamFactory<R> {
  bool disposed = false;
  final _subjects = <R, BehaviorSubject>{};
  final _streams = <R, Stream>{};

  T getValue<T>(R id) => (!disposed) && _subjects.containsKey(id)
      ? _subjects[id].value as T
      : null;

  void _registerStream<T>(R id, {T initialData}) {
    if (disposed || _streams.containsKey(id)) return;
    // if(initialData != null)0
    _subjects.putIfAbsent(id, () => BehaviorSubject<T>.seeded(initialData));
    _streams.putIfAbsent(id, () => _subjects[id].stream);
  }

  void setValue<T>(R id, T value) {
    if (disposed) return;
    _registerStream<T>(id);
    _subjects[id].sink.add(value);
  }

  Stream<T> getStream<T>(R id, {T initialData}) {
    _registerStream<T>(id, initialData: initialData);
    return _streams[id];
  }

  void registerStream<T>(R id, Stream<T> stream) {
    if (_streams.containsKey(id)) return;
    _streams.putIfAbsent(id, () => stream);
  }

  @mustCallSuper
  void disposeFactory() {
    disposed = true;
    _subjects.values.forEach((subject) => subject.close());
  }
}
