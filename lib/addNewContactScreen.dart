import 'package:flutter/material.dart';

import 'modals/contact.dart';
import 'Widgets/button.dart';
import 'Widgets/inputText.dart';
import 'utils/toast.dart';
import 'utils/alertDialog.dart';

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
    return WillPopScope(
      onWillPop: () {
        if (firstNameTxtController.text.isEmpty &&
            lastNameTxtController.text.isEmpty &&
            phoneNoTxtController.text.isEmpty &&
            emailTxtController.text.isEmpty) {
          Navigator.pop(
            context,
            null,
          );
        } else {
          showAlertDialog(
              context: context,
              buttonList: [
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    // int c = 0;
                    // Navigator.popUntil(context, (_)=> c++ >= 2);
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName('ContactScreen'),
                    );
                  },
                ),
              ],
              content: 'Discard Changes?');
        }
        return Future.value(true);
      },
      child: Scaffold(
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
      ),
    );
  }
}
