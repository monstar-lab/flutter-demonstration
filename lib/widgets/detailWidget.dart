import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final item;
  final int index;

  DetailWidget({this.item, this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // TODO: Heroの追加
        ItemImage(image: item.assetPath),
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

class ItemImage extends StatelessWidget {
  final image;

  ItemImage({this.image});

  @override
  Widget build(BuildContext context) {
    return (image is String)
        ? Image.asset(
            image,
            fit: BoxFit.cover,
            height: 400.0,
            width: MediaQuery.of(context).size.width,
          )
        : Image.file(
            image,
            fit: BoxFit.cover,
            height: 400.0,
            width: MediaQuery.of(context).size.width,
          );
  }
}
