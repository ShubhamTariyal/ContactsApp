import 'package:flutter/material.dart';

import 'contactsScreen.dart';
import 'Widgets/button.dart';
import 'Widgets/inputText.dart';
import 'toast.dart';

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
    Navigator.push(
      //pushReplacement
      context,
      MaterialPageRoute(builder: (context) => Contacts()),
    );
    print('$usrname $password Login');
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

// Text(
//   "UserName",
//   style: TextStyle(fontSize: 20),
// ),
// TextField(
//   style: TextStyle(fontSize: 19),
//   decoration: InputDecoration(
//     // labelText: 'Username',
//     contentPadding: EdgeInsets.symmetric( horizontal: 10),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.blueGrey,
//         width: 2,
//       ),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.grey,
//         width: 2,
//       ),
//     ),
//   ),
//   controller: usrnameTxtController,
//   textInputAction: TextInputAction.next,
//   onSubmitted: (_) {
//     FocusScope.of(context).requestFocus(textFocusNode);
//   },
// ),
// Container(
//   margin: EdgeInsets.only(top: 19),
// ),
// Text(
//   "Password",
//   style: TextStyle(fontSize: 20),
// ),
// TextField(
//   style: TextStyle(fontSize: 20),
//   decoration: InputDecoration(
//     // labelText: 'Username',
//     contentPadding: EdgeInsets.symmetric( horizontal: 10),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.blueGrey,
//         width: 2,
//       ),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.grey,
//         width: 2,
//       ),
//     ),
//   ),
//   controller: passwordTxtController,
//   textInputAction: TextInputAction.done,
//   focusNode: passwordFocusNode,
//   onSubmitted: (_) => login(context),
// ),
// Container(
//   margin: EdgeInsets.only(
//     top: 30,
//   ),
//   height: 40,
//   width: double.infinity,
//   child: RaisedButton(
//     child: Text(
//       'Login',
//       style: TextStyle(fontSize: 18),
//     ),
//     onPressed: () => login(context),
//     color: Colors.blue,
//     textColor: Colors.white,
//   ),
// )