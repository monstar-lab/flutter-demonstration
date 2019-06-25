import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final item;
  final int index;

  DetailWidget({this.item, this.index});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 300.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: index,
              child: Image.asset(
                item.assetPath,
                fit: BoxFit.cover,
              ),
              createRectTween: (rect1, rect2) =>
                  RectTween(begin: rect1, end: rect2),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ListTile(title: Text(item.name)),
          ]),
        ),
      ],
    );
  }
}
