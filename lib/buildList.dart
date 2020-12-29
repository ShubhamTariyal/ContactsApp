import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'toast.dart';
import 'alertDialog.dart';
import 'modals/contact.dart';

class BuildList extends StatefulWidget {
  final Function f;
  BuildList(this.f);
  @override
  _BuildListState createState() => _BuildListState(f);
}

class _BuildListState extends State<BuildList> {
  Function showDetails;
  _BuildListState(this.showDetails);
  @override
  Widget build(BuildContext context) {
    final contactsBox = Hive.box('contacts');
    return ListView.builder(
      itemCount: contactsBox.length,
      itemBuilder: (context, index) {
        final contact = contactsBox.getAt(index) as Contact;
        return Card(
          elevation: 2,
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/images/download.png'),
              radius: 25,
            ),
            title: Text(
              '${contact.firstName} ${contact.lastName}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              '${contact.phoneNo}',
            ),
            onTap: () {
              showDetails(context, contact);
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showAlertDialog(
                    context: context,
                    buttonList: [
                      FlatButton(
                        child: Text('Delete'),
                        onPressed: () {
                          setState(() {
                            contactsBox.deleteAt(index);
                            Navigator.pop(context);
                            toast('Deleted Contact');
                          });
                        },
                      ),
                    ],
                    content: 'Delete Contact?');
                // setState(() {
                //   contactsBox.deleteAt(index);
                // });
              },
            ),
          ),
        );
      },
    );
  }
}
