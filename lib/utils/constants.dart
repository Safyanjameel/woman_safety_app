import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff23b2a3);

void goto(BuildContext context, Widget screenName) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: ((context) => screenName)));
}

progressIndicator(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(
      child: CircularProgressIndicator(
        backgroundColor: primaryColor,
        strokeWidth: 7,
        color: Colors.red,
      ),
    ),
  );
}

dialogBox(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(text),
    ),
  );
}
