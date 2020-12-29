import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'toast.dart';
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
        print('----ssssss${contactsBox.length}sssss-----');
        // if (contact is Contact)
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
                //for (int i = index; i < contactsBox.length; ++i)
                // contactsBox.deleteAt(i);
                setState(() {
                  contactsBox.deleteAt(index);
                });
                toast('Deleted Contact');
                print(
                    "-----------Deleted: $index ${contactsBox.length}----------");
              },
            ),
          ),
        );
        // else
        // return Card();
      },
    );
  }
}
