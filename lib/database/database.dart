import 'package:flutter_sqflite/models/map_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'app.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('create table contact('
          'id integer primary key,'
          'name text,'
          'account_number integer)');
    }, version: 1);
  });
}

Future<int> save(String tableName, MapModel data) {
  return createDatabase().then((db) {
    return db.insert(tableName, data);
  }).catchError((error) {
    print('$error');
  });
}

Future<List<MapModel>> findAll(String tableName) {
  return createDatabase().then((db) {
    return db.query(tableName)
      .then((listOfMaps) => listOfMaps.map((map) => MapModel(source: map)).toList());
  });
}
