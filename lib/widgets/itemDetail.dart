import 'package:flutter/material.dart';
import 'package:flutter_livecoding/utils/assets.dart' as Assets;

class ItemDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: 'item1',
              child: Image.asset(
                Assets.ASSET_FOX_IMAGE_HALF,
                fit: BoxFit.cover,
              ),
              createRectTween: (rect1, rect2) =>
                  RectTween(begin: rect1, end: rect2),
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
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
