import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../widget/imagePicker.dart';

class homeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homeScreen();
  }
}

class _homeScreen extends State<homeScreen>{
  File? _selectedImge;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: userImagePicker(onPickImage: (onPickImage){
      _selectedImge = onPickImage;
    }),);
  }
}