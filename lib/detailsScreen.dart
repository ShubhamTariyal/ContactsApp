import 'package:flutter/material.dart';

import 'modals/contact.dart';

class Detail extends StatelessWidget {
  Detail(this.contact);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: widgetSize.height * 0.05,
          left: widgetSize.width * 0.05,
        ),
        width: widgetSize.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'First Name: ${contact.firstName}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Last Name: ${contact.lastName}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Phone No: ${contact.phoneNo}',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            if (contact.email.isNotEmpty)
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Email: ${contact.email}',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
