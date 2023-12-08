import 'package:flutter/material.dart';

alertDialog(BuildContext context, String msg) {
  Widget OkButton = TextButton(
    child: const Text('Ok'),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text(''),
    content: Text(msg),
    actions: [
      OkButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}