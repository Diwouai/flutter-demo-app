import 'package:flutter/material.dart';
import '../api/tmdb_api.dart';

class MovieProvider with ChangeNotifier {
  final TMDBService _tmdbService = TMDBService();

  List<dynamic> _trendingMovies = [];
  List<dynamic> _popularMovies = [];
  bool _isLoading = true;

  List<dynamic> get trendingMovies => _trendingMovies;
  List<dynamic> get popularMovies => _popularMovies;
  bool get isLoading => _isLoading;

  MovieProvider() {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      _isLoading = true;
      notifyListeners();

      final trending = await _tmdbService.fetchTrendingMovies();
      final popular = await _tmdbService.fetchPopularMovies();

      _trendingMovies = trending;
      _popularMovies = popular;
    } catch (e) {
      print('Error fetching movies: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
