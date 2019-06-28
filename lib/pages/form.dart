import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_livecoding/utils/localImages.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  File _image;
  String _name;
  String _date;

  @override
  initState() {
    super.initState();
    _name = '';
    _date = '';
  }

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(),
              // TODO: 写真投稿用フォーム作成
              // TODO: "写真のタイトル"フォーム作成
              // TODO: 撮影日入力フォーム作成
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(children: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ]),
      ),
      // TODO: 投稿ボタン作成
    );
  }
}

class ImageForm extends StatelessWidget {
  final File image;
  final Function onPressed;

  ImageForm({
    this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: GestureDetector(
          onTap: onPressed,
          child: (image == null)
              ? Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Center(child: Icon(Icons.add_a_photo)),
                )
              : Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: FileImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
