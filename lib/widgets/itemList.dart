import 'package:flutter/material.dart';
import 'package:flutter_livecoding/pages/photoDetailPage.dart';
import 'package:flutter_livecoding/utils/assets.dart' as Assets;

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: InkWell(
            child: Row(
              children: <Widget>[
                Image.asset(
                  Assets.ASSET_FOX_IMAGE_QUARTER,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                Text('一つ目の写真'),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PhotoDetailPage(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
