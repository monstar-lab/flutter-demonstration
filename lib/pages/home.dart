import 'package:flutter/material.dart';
import 'package:flutter_livecoding/widgets/listWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWidget(),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
