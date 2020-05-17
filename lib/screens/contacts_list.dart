import 'package:flutter/material.dart';
import 'package:flutter_sqflite/database/database.dart';
import 'package:flutter_sqflite/models/contact.dart';

import 'contact_form.dart';

final String _lblTitle = 'Contacts';
final String _lblLoading = 'Loading...';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_lblTitle),
      ),
      body: FutureBuilder(
        future:
            findAll(Contact.tblName, transformer: (m) => Contact(source: m)),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return _WaitingList();
          }
          List<Contact> contacts = snapshot.data.cast<Contact>();
          return ListView.builder(
            itemBuilder: (context, index) {
              return _ContactItem(contacts[index]);
            },
            itemCount: contacts.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactForm(),
            ),
          ).then((id){
            setState((){});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _WaitingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(_lblLoading),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
