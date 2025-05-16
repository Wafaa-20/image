import 'dart:io';

import 'package:flutter/material.dart';
import 'package:receipt/receipt/presentation/controller/image_controller.dart';
import 'package:receipt/receipt/presentation/widget/image_opation.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final controller = ImageController();
  String extractedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.selectedImage == null
              ? Text("Please Select image")
              : SizedBox(
                height: 200,
                width: 200,
                child: Image.file(File(controller.selectedImage!.path)),
              ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.teal.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageOption(
                  controller: controller,
                  imageState: () => setState(() {}),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final result = await controller.processImage();
              setState(() {
                extractedText = result;
              });
            },
            child: Text("Extract Text"),
          ),
          Text("Text: $extractedText", textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
