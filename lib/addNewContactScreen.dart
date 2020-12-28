import 'package:flutter/material.dart';

import 'modals/contact.dart';
import 'Widgets/button.dart';
import 'Widgets/inputText.dart';
import 'toast.dart';

class NewContact extends StatefulWidget {
  @override
  _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  final firstNameTxtController = TextEditingController();
  final lastNameTxtController = TextEditingController();
  final phoneNoTxtController = TextEditingController();
  final emailTxtController = TextEditingController();

  FocusNode lastNameFocusNode = new FocusNode();
  FocusNode phoneNoFocusNode = new FocusNode();
  FocusNode emailFocusNode = new FocusNode();

  void _addNewContact(BuildContext context) {
    var firstname = firstNameTxtController.text;
    var lastname = lastNameTxtController.text;
    var phoneNo = phoneNoTxtController.text;
    var email = emailTxtController.text;

    if (firstname.isEmpty || lastname.isEmpty || phoneNo.isEmpty) {
      toast('Name and PhoneNo Field cannot be empty');
      return;
    }
    toast('Added Contact');
    Navigator.pop(
      context,
      Contact(
        firstName: firstname,
        lastName: lastname,
        phoneNo: phoneNo,
        email: email,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Contact',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: widgetSize.height * 0.05,
            left: widgetSize.width * 0.1,
          ),
          width: widgetSize.width * 0.8,
          // color: Colors.red,
          child: Column(
            children: [
              InputText(
                title: 'First Name',
                txtController: firstNameTxtController,
                targetFocusNode: lastNameFocusNode,
              ),
              InputText(
                title: 'Last Name',
                txtController: lastNameTxtController,
                widgetFocusNode: lastNameFocusNode,
                targetFocusNode: phoneNoFocusNode,
              ),
              InputText(
                title: 'Phone No.',
                txtController: phoneNoTxtController,
                widgetFocusNode: phoneNoFocusNode,
                targetFocusNode: emailFocusNode,
              ),
              InputText(
                title: 'Email',
                txtController: emailTxtController,
                widgetFocusNode: emailFocusNode,
                next: false,
                callback: () => _addNewContact(context),
              ),
              CustomButton(() => _addNewContact(context), 'Add'),
            ],
          ),
        ),
      ),
    );
  }
}
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
//   Text(
//     "First Name",
//     style: TextStyle(fontSize: 18),
//   ),
//   TextField(
//     controller: firstNameTxtController,
//     textInputAction: TextInputAction.next,
//     onSubmitted: (_) {
//       FocusScope.of(context).requestFocus(lastNameFocusNode);
//     },
//   ),
//   Text(
//     "Last Name",
//     style: TextStyle(fontSize: 18),
//   ),
//   TextField(
//     controller: lastNameTxtController,
//     textInputAction: TextInputAction.next,
//     focusNode: lastNameFocusNode,
//     onSubmitted: (_) {
//       FocusScope.of(context).requestFocus(phoneNoFocusNode);
//     },
//   ),
//   Container(
//     margin: EdgeInsets.only(top: 20),
//   ),
//   Text(
//     "Phone No.",
//     style: TextStyle(fontSize: 18),
//   ),
//   TextField(
//     controller: phoneNoTxtController,
//     textInputAction: TextInputAction.next,
//     focusNode: phoneNoFocusNode,
//     onSubmitted: (_) {
//       FocusScope.of(context).requestFocus(emailFocusNode);
//     },
//   ),
//   Text(
//     "Email: ",
//     style: TextStyle(fontSize: 18),
//   ),
//   TextField(
//     controller: emailTxtController,
//     textInputAction: TextInputAction.done,
//     focusNode: emailFocusNode,
//     onSubmitted: (_) => _addNewContact(),
//   ),
//   Container(
//     margin: EdgeInsets.only(
//       top: 30,
//     ),
//     height: 40,
//     width: double.infinity,
//     child: RaisedButton(
//       child: Text(
//         'Done',
//         style: TextStyle(fontSize: 18),
//       ),
//       onPressed: _addNewContact,
//       color: Colors.blue,
//       textColor: Colors.white,
//     ),
//   ),
// ],
