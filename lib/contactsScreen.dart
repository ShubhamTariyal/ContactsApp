import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'buildList.dart';
import 'detailsScreen.dart';
import 'addNewContactScreen.dart';
import 'loginScreen.dart';
import 'modals/contact.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  void _addContact(BuildContext context) async {
    Contact newContact = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => NewContact()),
    );
    if (newContact is Contact) {
      setState(() {
        Hive.box('contacts').add(newContact);
      });
    }
  }

  void _showDetails(BuildContext context, Contact contact) {
    // if(contact is Contact)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Detail(contact)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Hive.openBox('contacts'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Contacts'),
                  actions: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          color: Colors.lightBlue,
                          child: IconButton(
                            onPressed: () {
                              _addContact(context);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                body: BuildList(_showDetails),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => _addContact(context),
                ),
              );
            }
          } else {
            return Scaffold();
          }
        });
  }

  @override
  void dispose() {
    Hive.box('contacts')
        .compact(); //to compact contacts Box(optional as Hive can do it automatically)
    Hive.box('contacts').close(); //or Hive.close() to close all boxes
    super.dispose();
  }
}
