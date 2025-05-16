import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class ImageController {
  final ImagePicker picker = ImagePicker();
  final cameraImage = (ImageSource.camera);
  final galleryImage = (ImageSource.gallery);
  XFile? selectedImage;

  Future<XFile?> getImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selectedImage = image;
      return selectedImage;
    } else {
      return null;
    }
  }

  //Step 1: convert xfile to input Image
  InputImage? getInputImage() {
    return selectedImage != null
        ? InputImage.fromFilePath(selectedImage!.path)
        : null;
  }

  Future<String> processImage() async {
    try {
      final inputImage = getInputImage();
      if (inputImage == null) {
        return "No Image to Proses";
      }

      final textRecognizer = TextRecognizer(
        script: TextRecognitionScript.latin,
      );

      final result = await textRecognizer.processImage(inputImage);
      await textRecognizer.close();

      if (result.text.trim().isEmpty) {
        return "🚫 لم يتم العثور على نص في الصورة";
      }
      print("✅ النص المستخرج:");
      print(result.text);

      return result.text;
    } catch (e) {
      print("Error in :$e");
      return "⚠️ خطأ أثناء قراءة الصورة: $e";
    }
  }
}
