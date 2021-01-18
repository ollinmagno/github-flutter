import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key key, this.text = "Enviar", this.onPressed})
      : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.red,
      textColor: Colors.white,
      child: Text(
        text,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}