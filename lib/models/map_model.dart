import 'dart:collection';
import 'dart:core';

class MapModel implements Map<String, dynamic> {
  final Map<String, dynamic> _innerMap = HashMap();

  MapModel({Map<String, dynamic> source}) {
    if (source != null) addAll(source);
  }

  @override
  operator [](dynamic key) => _innerMap[key];

  @override
  void operator []=(String key, value) => _innerMap[key] = value;

  @override
  void addAll(Map<String, dynamic> other) => _innerMap.addAll(other);

  @override
  void addEntries(Iterable<MapEntry<String, dynamic>> newEntries) =>
      _innerMap.addEntries(newEntries);

  @override
  void clear() => _innerMap.clear();

  @override
  bool containsKey(Object key) => _innerMap.containsKey(key);

  @override
  bool containsValue(dynamic value) => _innerMap.containsValue(value);

  @override
  void forEach(Function fnc) => _innerMap.forEach(fnc);

  @override
  dynamic remove(Object key) => _innerMap.remove(key);

  @override
  Map<RK, RV> cast<RK, RV>() => _innerMap.cast();

  @override
  Iterable<MapEntry<String, dynamic>> get entries => _innerMap.entries;

  @override
  bool get isEmpty => _innerMap.isEmpty;

  @override
  bool get isNotEmpty => _innerMap.isNotEmpty;

  @override
  Iterable<String> get keys => _innerMap.keys;

  @override
  int get length => _innerMap.length;

  @override
  Map<K2, V2> map<K2, V2>(Function f) => _innerMap.map(f);

  @override
  putIfAbsent(String key, dynamic Function() ifAbsent) =>
      _innerMap.putIfAbsent(key, ifAbsent);

  @override
  Iterable get values => _innerMap.values;

  @override
  void removeWhere(Function predicate) => _innerMap.removeWhere(predicate);

  @override
  dynamic update(String key, dynamic Function(dynamic) update,
      {Function() ifAbsent}) {
    if (ifAbsent != null) {
      _innerMap.update(key, update, ifAbsent: ifAbsent);
    } else {
      _innerMap.update(key, update);
    }
  }

  @override
  void updateAll(dynamic Function(String, dynamic) fnc) =>
      _innerMap.updateAll(fnc);

  @override
  String toString() {
    final String values =
        _innerMap.entries.map((e) => '${e.key}=${e.value}').join(', ');
    return 'MapModel: [$values]';
  }
}
