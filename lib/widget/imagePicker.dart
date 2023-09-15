
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class userImagePicker extends StatefulWidget {
  const userImagePicker({
    super.key,
    required this.onPickImage});
  // final void

  final void Function(File _selectedImage) onPickImage;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _userImagePickerState();
  }
}

class _userImagePickerState extends State<userImagePicker> {
  File? _pickedImage;
  void _pickImage() async {
    final pickedImage  = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxWidth: 150
    );
    if(pickedImage == null) return;
    setState(() {
      _pickedImage = File(pickedImage.path);
    });
    widget.onPickImage(_pickedImage!);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: [
          SizedBox(height: 60),
          // Expanded(child: child)
          Container(
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
            ),
            child: _pickedImage != null ?
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.file(
                _pickedImage!, // Assuming _pickedImage is the File object of the captured image
                fit: BoxFit.cover,
                width:  400,
                height: 300,
              ),
            ):
              Center(child: Text("No image",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),),
          ),
          TextButton.icon(
            onPressed: _pickImage,
            icon: Icon(Icons.image),
            label: Text('Add image', style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),),
          ),
          // )
        ],
      ),
    );
  }
}
