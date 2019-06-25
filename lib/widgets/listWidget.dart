import 'package:flutter/material.dart';
import 'package:flutter_livecoding/pages/photoDetailPage.dart';
import 'package:flutter_livecoding/utils/pageTransitions.dart';
import 'package:flutter_livecoding/utils/exampleData.dart';

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: InkWell(
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: 'item1',
                      child: Image.asset(
                        exampleData[0].assetPath,
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(exampleData[0].name),
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
          ),
        ],
      ),
    );
  }
}
