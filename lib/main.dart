import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Editor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  File imageFile;

  Future _getImage(int type) async {
  
    var image = await ImagePicker.pickImage(
      source: type == 1 ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50
    );

    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 600,
      maxHeight: 600,
    );

    var compressedFile = await FlutterImageCompress.compressAndGetFile(
      croppedFile.path,
      croppedFile.path,
      quality: 50,
    );

    setState(() {
      imageFile = compressedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Editor"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            imageFile != null
                ? Image.file(
                    imageFile,
                    height: MediaQuery.of(context).size.height / 2,
                  )
                : Text("Image editor"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Picker"),
                content: new Text("Select image picker type."),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("Camera"),
                    onPressed: () {
                      _getImage(1);
                      Navigator.pop(context);
                    },
                  ),
                  new FlatButton(
                    child: new Text("Gallery"),
                    onPressed: () {
                      _getImage(2);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Pick Image',
        child: Icon(Icons.camera),
      ),
    );
  }
}
