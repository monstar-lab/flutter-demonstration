import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future saveImage({File image, String name}) async {
  final path = (await getApplicationDocumentsDirectory()).path;
  final now = DateTime.now().toString();
  final imagePath = '$path/image_$now.png';

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final imageCount = (prefs.getInt('count') ?? 0);
  await prefs.setString('image$imageCount', imagePath);
  await prefs.setString('name$imageCount', name ?? '');
  await prefs.setInt('count', imageCount + 1);

  return await image.copy(imagePath);
}

Future<LoadedImages> loadImages() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final count = prefs.getInt('count') ?? 0;
  List<LoadedImage> imageList = [];
  for (var index = 0; index < count; index++) {
    final imagePath = prefs.getString('image$index');
    final name = prefs.getString('name$index');
    final loadedImage = LoadedImage(name, File(imagePath));
    imageList.add(loadedImage);
  }

  return LoadedImages(count, imageList);
}

class LoadedImages {
  final int count;
  final List<LoadedImage> images;

  LoadedImages(this.count, this.images);
}

class LoadedImage {
  final String name;
  final File assetPath;

  LoadedImage(this.name, this.assetPath);
}
