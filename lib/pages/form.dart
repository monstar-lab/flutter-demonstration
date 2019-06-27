import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  File _image;

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
            children: <Widget>[
              ImageForm(
                image: _image,
                onPressed: () {
                  getImage();
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: '写真のタイトル'),
              ),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {},
      ),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 300.0,
          width: 300.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            image: (image == null)
                ? null
                : DecorationImage(
                    image: FileImage(image),
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
