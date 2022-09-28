import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utility/color_utility.dart';
import '../../utility/constants.dart';
import 'list_tile_widget.dart';
import 'dart:async';

import 'package:image_picker/image_picker.dart';

class SourcePage extends StatefulWidget {
  final MediaSource source;
  final Function callback;
  const SourcePage({Key? key, required this.source, required this.callback}) : super(key: key);

  @override
  State<SourcePage> createState() => _SourcePageState();
}

class _SourcePageState extends State<SourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Select Source'),
      ),
      body: ListView(
        children: [
          CameraButtonWidget(source: widget.source,callback: (File file){
            widget.callback(file);
          }),
          GalleryButtonWidget(source: widget.source,callback: (File file){
            widget.callback(file);
          }),
        ],
      ),
    );
  }
}


class CameraButtonWidget extends StatefulWidget {
  final MediaSource source;
  final Function callback;
  const CameraButtonWidget({Key? key, required this.source, required this.callback}) : super(key: key);

  @override
  State<CameraButtonWidget> createState() => _CameraButtonWidgetState();
}

class _CameraButtonWidgetState extends State<CameraButtonWidget> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  void _setImageFileListFromFile(XFile? value) {
    imageFile = value == null ? null : File(value.path);
    widget.callback(imageFile);
  }

  @override
  Widget build(BuildContext context) => ListTileWidget(
        text: 'From Camera',
        icon: Icons.camera_alt,
        onClicked: () => pickCameraMedia(context),
      );

  Future pickCameraMedia(BuildContext context) async {
    XFile? pickedFile;
    try {
      if(widget.source == MediaSource.image) {
        pickedFile = await _picker.pickImage(
          source: ImageSource.camera,
        );
      }else{
        pickedFile = await _picker.pickVideo(
            source: ImageSource.camera, maxDuration: const Duration(seconds: 10));
      }
      _setImageFileListFromFile(pickedFile);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

class GalleryButtonWidget extends StatefulWidget {
  final MediaSource source;
  final Function callback;
  const GalleryButtonWidget({Key? key, required this.source, required this.callback}) : super(key: key);

  @override
  State<GalleryButtonWidget> createState() => _GalleryButtonWidgetState();
}

class _GalleryButtonWidgetState extends State<GalleryButtonWidget> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  void _setImageFileListFromFile(XFile? value) {
    imageFile = value == null ? null : File(value.path);
    widget.callback(imageFile);
  }

  @override
  Widget build(BuildContext context) => ListTileWidget(
    text: 'From Gallery',
    icon: Icons.camera_alt,
    onClicked: () => pickCameraMedia(context),
  );

  Future pickCameraMedia(BuildContext context) async {
    XFile? pickedFile;
    try {
      if(widget.source == MediaSource.image) {
        pickedFile = await _picker.pickImage(
          source: ImageSource.gallery,
        );
      }else{
        pickedFile = await _picker.pickVideo(
            source: ImageSource.gallery, maxDuration: const Duration(seconds: 10));
      }
      _setImageFileListFromFile(pickedFile);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
