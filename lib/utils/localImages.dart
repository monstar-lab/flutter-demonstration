import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future saveImage(File image) async {
  final path = (await getApplicationDocumentsDirectory()).path;
  final now = DateTime.now().toString();
  final imagePath = '$path/image_$now.png';

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final imageCount = (prefs.getInt('count') ?? 0);
  await prefs.setString('image$imageCount', imagePath);
  await prefs.setInt('count', imageCount + 1);

  return await image.copy(imagePath);
}

Future<File> loadImage(int index) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final imagePath = prefs.getString('image$index');

  return File(imagePath);
}
