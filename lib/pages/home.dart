import 'package:flutter/material.dart';
import 'package:flutter_livecoding/widgets/itemList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemList(),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
