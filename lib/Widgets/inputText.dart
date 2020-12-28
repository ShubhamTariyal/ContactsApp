import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  InputText({
    @required this.title,
    @required this.txtController,
    this.next = true,
    this.callback,
    this.widgetFocusNode,
    this.targetFocusNode,
  });

  final String title;
  final bool next;

  final TextEditingController txtController;
  final FocusNode widgetFocusNode;
  final FocusNode targetFocusNode;

  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 19),
          ),
          Container(margin: EdgeInsets.only(bottom: 10),),
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2,
                ),
              ),
            ),
            controller: txtController,
            textInputAction: next ? TextInputAction.next : TextInputAction.done,
            focusNode: widgetFocusNode,
            onSubmitted: (_) {
              if (targetFocusNode is FocusNode) {
                FocusScope.of(context).requestFocus(targetFocusNode);
              }
              if (callback is Function) {
                callback();
              }
            },
          ),
        ],
      ),
    );
  }
}
