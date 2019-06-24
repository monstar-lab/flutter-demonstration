import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('一つ目の写真'),
          onTap: () {},
        ),
      ],
    );
  }
}
