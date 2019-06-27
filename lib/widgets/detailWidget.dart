import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final item;
  final int index;

  DetailWidget({this.item, this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: index,
          child: Image.asset(
            item.assetPath,
            fit: BoxFit.cover,
            height: 400.0,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            children: <Widget>[
              SizedBox(height: 360.0),
              ListTile(title: Text(item.name)),
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
