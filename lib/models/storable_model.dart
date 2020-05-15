import 'package:flutter_sqflite/models/map_model.dart';

abstract class StorableModel {

  MapModel toMap();

  void fromMap(MapModel map);

  String tableName();
}