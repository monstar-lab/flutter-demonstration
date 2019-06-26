import 'package:flutter/material.dart';
import 'package:flutter_livecoding/widgets/listWidget.dart';
import 'package:flutter_livecoding/pages/form.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWidget(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FormPage()));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
