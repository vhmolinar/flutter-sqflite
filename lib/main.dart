import 'package:flutter/material.dart';

import 'screens/dashboard.dart';

void main() {
  runApp(ByteBankApp());
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
