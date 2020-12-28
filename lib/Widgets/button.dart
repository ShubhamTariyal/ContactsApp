import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function _func;
  final String name;

  CustomButton(
    this._func,
    this.name,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
      ),
      height: 40,
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          name,
          style: TextStyle(fontSize: 18),
        ),
        onPressed: _func,
        color: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
