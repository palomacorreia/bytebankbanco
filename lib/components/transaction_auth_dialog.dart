import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  TransactionAuthDialog({
    @required this.onConfirm,
  });

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Autenticação"),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: 4,
        decoration: InputDecoration(border: OutlineInputBorder()),
        style: TextStyle(fontSize: 32, letterSpacing: 32),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Confirm'),
          onPressed: () {
            //print('confirm');
            widget.onConfirm(_passwordController.text);
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
