// ignore_for_file: prefer_final_fields, avoid_print, unnecessary_this
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:practica_final_2/models/models.dart';
import 'package:practica_final_2/models/popular_movie.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '97b0380338727eab15ceaf56e2402a4e';
  String _language = 'es_ES';
  String _page = '1';

  List<Movie> onDisplayMovies = [];
  List<Movie> onPopularMovies = [];

  Map<int, List<Cast>> casting = {};

  MoviesProvider() {
    this.getOnDisplayMovies();
    this.getOnPopulars();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': _page});

    // Await the http get response, then decode the json-formatted response.
    final result = await http.get(url);

    final nowPlayingMovies = NowPlayingMovies.fromJson(result.body);

    onDisplayMovies = nowPlayingMovies.results;

    notifyListeners();
  }

  getOnPopulars() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': _page});

    final result = await http.get(url);

    final popularMovies = PopularMovies.fromJson(result.body);

    onPopularMovies = popularMovies.results;

    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int idMovie) async {
    print('getMovieCast');
    var url = Uri.https(_baseUrl, '3/movie/$idMovie/credits',
        {'api_key': _apiKey, 'language': _language});

    final result = await http.get(url);

    final creditsResponse = CastResponse.fromJson(result.body);

    casting[idMovie] = creditsResponse.cast;

    return creditsResponse.cast;
  }
}
