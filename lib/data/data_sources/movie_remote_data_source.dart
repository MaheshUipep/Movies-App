import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/core/api_constants.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getUpcoming();
  Future<List<MovieModel>> getPlayingNow();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _apiclient;

  MovieRemoteDataSourceImpl(this._apiclient);
  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _apiclient.get("trending/movie/day");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await _apiclient.get("movie/popular");
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getUpcoming() async {
    final response = await _apiclient.get('mpvie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _apiclient.get('mpvie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }
}
