import 'package:flutter/material.dart';
import 'package:receipt/receipt/presentation/controller/image_controller.dart';

class ImageOption extends StatefulWidget {
  const ImageOption({
    super.key,
    required this.controller,
    required this.imageState,
  });
  final ImageController controller;
  final VoidCallback imageState;

  @override
  State<ImageOption> createState() => _ImageOptionState();
}

class _ImageOptionState extends State<ImageOption> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () async {
            await widget.controller.getImage(widget.controller.cameraImage);
            widget.imageState();
          },
          icon: Icon(Icons.camera_alt),
        ),
        IconButton(
          onPressed: () async {
            await widget.controller.getImage(widget.controller.galleryImage);
            widget.imageState();
          },
          icon: Icon(Icons.photo_library),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.insert_drive_file)),
      ],
    );
  }
}
