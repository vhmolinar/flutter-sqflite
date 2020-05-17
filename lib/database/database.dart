import 'package:flutter_sqflite/models/map_model.dart';
import 'package:flutter_sqflite/models/storable_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String _databaseName = 'app.db';

Future<Database> _getDatabase() async {
  final String path = join(await getDatabasesPath(), _databaseName);
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(_tableContactDDL());
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}

String _tableContactDDL() => 'create table contact('
    'id integer primary key,'
    'name text,'
    'account_number integer)';

Future<int> save(String tableName, MapModel data) async {
  Database db = await _getDatabase();
  return db.insert(tableName, data);
}

Future<List<dynamic>> findAll(String tableName,
    {StorableModel Function(MapModel) transformer}) async {
  Database db = await _getDatabase();
  List<Map> rows = await db.query(tableName);
  return rows
      .map((row) => MapModel(source: row))
      .map((map) => transformer != null ? transformer(map) : map)
      .toList();
}
