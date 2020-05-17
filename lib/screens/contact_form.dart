import 'package:flutter/material.dart';
import 'package:flutter_sqflite/database/database.dart';
import 'package:flutter_sqflite/models/contact.dart';

final String _lblTitle = 'New Contact';
final String _lblName = 'Full name';
final String _lblAccountNumber = 'Account number';
final String _lblBtnCreate = 'Create';

class ContactForm extends StatelessWidget {
  final TextEditingController _ctrlName = TextEditingController();
  final TextEditingController _ctrlAccount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_lblTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _ctrlName,
              decoration: InputDecoration(labelText: _lblName),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _ctrlAccount,
                decoration: InputDecoration(labelText: _lblAccountNumber),
                style: TextStyle(
                  fontSize: 24,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text(_lblBtnCreate),
                  onPressed: () {
                    final String name = _ctrlName.text;
                    final int accNumber = int.tryParse(_ctrlAccount.text);

                    final contact =
                        Contact(name: name, accountNumber: accNumber);
                    save(contact.tableName(), contact.toMap())
                        .then((id) => Navigator.pop(context, id));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
