import 'package:flutter/material.dart';
import 'package:flutter_livecoding/widgets/detailWidget.dart';

class PhotoDetailPage extends StatelessWidget {
  final item;
  final int index;

  PhotoDetailPage({this.item, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailWidget(item: item, index: index),
    );
  }
}
