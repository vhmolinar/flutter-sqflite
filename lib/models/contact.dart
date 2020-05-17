import 'map_model.dart';
import 'storable_model.dart';

class Contact implements StorableModel {
  int id;
  String name;
  int accountNumber;

  static final String tblName = 'contact';
  static final String colId = 'id';
  static final String colName = 'name';
  static final String colAccountNumber = 'account_number';

  Contact({this.name, this.accountNumber, this.id, source}) {
    if (source != null) {
      fromMap(source);
    }
  }

  @override
  String toString() {
    return 'Contact [name: $name, accountNumber: $accountNumber]';
  }

  @override
  MapModel toMap() {
    MapModel map = MapModel();
    map[colId] = this.id;
    map[colName] = this.name;
    map[colAccountNumber] = this.accountNumber;
    return map;
  }

  @override
  String tableName() {
    return tblName;
  }

  @override
  void fromMap(MapModel map) {
    this.id = map[colId] ;
    this.name = map[colName];
    this.accountNumber = map[colAccountNumber];
  }  
}
