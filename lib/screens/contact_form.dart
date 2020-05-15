import 'package:flutter/material.dart';
import 'package:flutter_sqflite/models/contact.dart';

class ContactForm extends StatelessWidget {

  final TextEditingController _ctrlName = TextEditingController();
  final TextEditingController _ctrlAccount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Contact',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _ctrlName,
              decoration: InputDecoration(
                labelText: 'Full name',
              ),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _ctrlAccount,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                ),
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
                  child: Text('Create'),
                  onPressed: () {
                    final String name = _ctrlName.text;
                    final int accNumber = int.tryParse(_ctrlAccount.text);

                    final contact = Contact(name, accNumber);
                    Navigator.pop(context, contact);
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
