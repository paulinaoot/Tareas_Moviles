import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Storage {
  Future<String> getLocalPath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/audio.m4a';
    return filePath;
  }

  Future<String?> readFile(File file) async {
    try {
      final contents = file.readAsBytesSync();
      return base64Encode(contents);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
