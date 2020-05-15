import 'package:flutter/material.dart';
import 'package:flutter_sqflite/database/database.dart';

import 'models/contact.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(ByteBankApp());

  final contact = Contact('alex', 1000);
  save(contact.tableName(), contact.toMap()).then((id){
     debugPrint('Generated: $id');
     findAll(contact.tableName()).then((list) {
       list.forEach((row) => debugPrint('Row: $row'));
     });
  });
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darkTheme = ThemeData.dark().copyWith(
      accentColor: Colors.green[800],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.green[800],
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.green[800],
      ),
    );

    return MaterialApp(
      home: Dashboard(),
      theme: darkTheme,
    );
  }
}
