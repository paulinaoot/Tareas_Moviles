import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Network {
  String mainUrl = 'api.audd.io';

  dynamic getSong(String audioAsBytes) async {
    Uri url = Uri.https(this.mainUrl);

    http.Response response = await http.post(url, body: {
      'api_token': dotenv.env['API_KEY'],
      'audio': audioAsBytes,
      'return': 'apple_music,spotify',
    });

    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      final result = await jsonDecode(response.body);
      print(result);
      return result;
    } else {
      print('Something went wrong :(');
      return null;
    }
  }
}
// Practica 3 cool, alberto rocks

/**
 * result.artist
 * result.title
 * result.song_link
 * result.apple_music.artwork.url
 */