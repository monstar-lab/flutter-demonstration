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
              Center(
                child: ImageForm(
                  image: _image,
                  onPressed: () {
                    getImage();
                  },
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: '写真のタイトル'),
                onChanged: (newName) {
                  setState(() {
                    _name = newName;
                  });
                },
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('撮影日'),
                  RaisedButton(
                    child: Text(_date),
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now().subtract(Duration(days: 7)),
                        firstDate: DateTime(2018),
                        lastDate: DateTime.now(),
                      );
                      setState(() {
                        _date = '${date.year}/${date.month}/${date.day}';
                      });
                    },
                  ),
                ],
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
        onPressed: (_image == null)
            ? null
            : () {
                try {
                  saveImage(
                    image: _image,
                    name: _name,
                  );
                } catch (e) {
                  print(e);
                }
                Navigator.of(context).pop();
              },
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
