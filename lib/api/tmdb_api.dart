import 'dart:convert';
import 'package:http/http.dart' as http;

class TMDBService {
  final String apiKey = 'ec6d53f8c6e364ecee8e6df9d9382d56';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<dynamic>> fetchTrendingMovies() async {
    final url = Uri.parse('$baseUrl/trending/movie/day?api_key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<dynamic>> fetchPopularMovies() async {
    final url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  Future<dynamic> fetchMovieDetails(int movieId) async {
    final url = Uri.parse('$baseUrl/movie/$movieId?api_key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
