import 'package:flutter/material.dart';
import 'package:flutter_livecoding/pages/photoDetailPage.dart';
import 'package:flutter_livecoding/utils/pageTransitions.dart';
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
                Hero(
                  tag: 'item1',
                  child: Image.asset(
                    Assets.ASSET_FOX_IMAGE_QUARTER,
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('一つ目の写真'),
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(
                fadePageRoute(
                  PhotoDetailPage(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
