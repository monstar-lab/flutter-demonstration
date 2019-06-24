import 'package:flutter/material.dart';
import 'package:flutter_livecoding/utils/assets.dart' as Assets;

class ItemDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              Assets.ASSET_FOX_IMAGE_HALF,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ListTile(title: Text('きつね')),
          ]),
        ),
      ],
    );
  }
}
