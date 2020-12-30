//Validation is implemented yet
import 'package:flutter/material.dart';

import 'contactsScreen.dart';
import 'Widgets/button.dart';
import 'Widgets/inputText.dart';
import 'utils/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usrnameTxtController = TextEditingController();
  final passwordTxtController = TextEditingController();

  FocusNode passwordFocusNode = new FocusNode(); //to mark focus target

  void login(context) {
    var usrname = usrnameTxtController.text;
    var password = passwordTxtController.text;
    if (usrname.isEmpty || password.isEmpty) {
      toast('Field cannot be empty!');
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          settings: RouteSettings(name: 'ContactScreen'),
          builder: (context) => Contacts()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;

    //return MaterialApp(
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacts Login',
        ),
      ),
      body: Container(
        // color: Colors.red,
        margin: EdgeInsets.only(
          top: widgetSize.height * 0.1,
          left: widgetSize.width * 0.15,
        ),
        width: widgetSize.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputText(
              title: 'UserName',
              txtController: usrnameTxtController,
              targetFocusNode: passwordFocusNode,
            ),
            InputText(
              title: 'Password',
              txtController: passwordTxtController,
              widgetFocusNode: passwordFocusNode,
              next: false,
              callback: () => login(context),
            ),
            CustomButton(() => login(context), 'Login'),
          ],
        ),
      ),
    );
  }
}
