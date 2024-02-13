import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/Api/constands.dart';
import 'package:movie_app/Api/model.dart';

class MovieService {
  Future<List<ApiDataModel>> getMovies(String category) async {
    final url = Uri.parse('${Constants.baseUrl}$category${Constants.apiKey}');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => ApiDataModel.fromJson(json)).toList();
    } else {
      throw Exception('Could Not Fetch Movies');
    }
  }
}
