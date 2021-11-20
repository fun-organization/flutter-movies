import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/models.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey = 'bdd7a571497d5faf60787205ecb4057f';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'en-US';

  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider(){
    print('Movies Provider Initialized');

    this.getNowPlayingMovies();
    this.getPopularMovies();
  }

  // Future<String> _getJsonData () {
    
  // }

  getNowPlayingMovies() async {
      var url = Uri.https(this._baseUrl, '3/movie/now_playing', {
        'api_key': _apiKey,
        'language': _language,
        'page': '1'
      });

      final response = await http.get(url);
      final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
      nowPlayingMovies = nowPlayingResponse.results;

      notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(this._baseUrl, '3/movie/popular', {
        'api_key': _apiKey,
        'language': _language,
        'page': '1'
      });

      final response = await http.get(url);
      final popularResponse = PopularResponse.fromJson(response.body);
      popularMovies = [...popularMovies, ...popularResponse.results];

      print(popularMovies[0]);
      notifyListeners();
  }
}