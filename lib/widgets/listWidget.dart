import 'package:flutter/material.dart';
import 'package:flutter_livecoding/pages/photoDetailPage.dart';
import 'package:flutter_livecoding/utils/pageTransitions.dart';
import 'package:flutter_livecoding/utils/exampleData.dart';

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.all(20.0),
        itemCount: exampleData.length,
        itemBuilder: (context, index) => ListItem(
              item: exampleData[index],
              index: index,
            ),
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
              Hero(
                tag: index,
                child: Image.asset(
                  item.assetPath,
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
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