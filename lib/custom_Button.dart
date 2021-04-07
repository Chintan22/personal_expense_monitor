import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function btnMethod;

  CustomButton(this.btnText, this.btnMethod);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              btnText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: btnMethod,
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              btnText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: btnMethod,
          );
  }
}
