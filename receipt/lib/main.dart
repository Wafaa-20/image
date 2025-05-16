import 'package:flutter/material.dart';
import 'package:receipt/receipt/presentation/page/image_picker_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ImagePickerPage());
  }
}
