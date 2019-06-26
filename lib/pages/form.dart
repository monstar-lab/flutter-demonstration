import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: '写真のタイトル'),
            ),
            RaisedButton(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
