import 'package:flutter/material.dart';
import 'package:flutter_livecoding/utils/assets.dart' as Assets;

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('一つ目の写真'),
          leading: Image.asset(
            Assets.ASSET_FOX_IMAGE_QUARTER,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
