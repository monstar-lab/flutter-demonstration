import 'package:flutter/material.dart';
import 'package:flutter_livecoding/pages/photoDetailPage.dart';
import 'package:flutter_livecoding/utils/pageTransitions.dart';
import 'package:flutter_livecoding/utils/exampleData.dart';
import 'package:flutter_livecoding/utils/localImages.dart';

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<LoadedImages>(
        future: loadImages(),
        builder: (context, snapshot) {
          return ListView.builder(
            padding: EdgeInsets.all(20.0),
            // TODO: iPhone内の画像を使用
            itemCount: exampleData.length,
            itemBuilder: (context, index) => ListItem(
                  // TODO: iPhone内の画像を使用
                  item: exampleData[index],
                  index: index,
                ),
          );
        },
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final item;
  final int index;

  ListItem({this.item, this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          child: Row(
            children: <Widget>[
              // TODO: Heroの追加
              ItemImage(image: item.assetPath),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(item.name),
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(
              fadePageRoute(
                PhotoDetailPage(
                  item: item,
                  index: index,
                ),
              ),
            );
          },
        ),
      ),
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
            height: 150.0,
            width: 150.0,
          )
        : Image.file(
            image,
            fit: BoxFit.cover,
            height: 150.0,
            width: 150.0,
          );
  }
}
