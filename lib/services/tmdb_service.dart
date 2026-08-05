import '../models/media_item.dart';
import '../constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class TmdbService {

  final apiConstant = Constants();

  Future<List<MediaItem>> fetchTrending() async {
    try {
      final response = await http.get(Uri.parse("${apiConstant.apiUrlTrending}?api_key=${apiConstant.apiKey}"));

      if(response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List<dynamic>;

        return results.map((json) => MediaItem.fromJson(json)).toList();
      }
      else {
        throw Exception("Failed to load the trending movies and tv");
      }
    } catch (error) {
      throw Exception("Error fetching the show/movie data: $error");
    }
  }
}