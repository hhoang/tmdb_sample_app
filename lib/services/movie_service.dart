import 'package:dio/dio.dart';
import 'package:imdb/models/movie_details_response.dart';
import 'package:imdb/models/movie_videos_response.dart';
import 'package:imdb/models/now_playing_response.dart';
import 'package:imdb/services/base_service.dart';

class MovieService extends BaseService {
  final String baseUrl = "https://api.themoviedb.org/3/";

  final String posterUrl = "https://image.tmdb.org/t/p/original/";
   static MovieService? _instance;

  factory MovieService() => _instance ??= MovieService._();

  MovieService._();

  Future<NowPlayingResponse?> getNowPlayingMovies() async {
    print("get now playing movies");
    try {
      var response = await dio.get('movie/now_playing');
      final res = NowPlayingResponse.fromJson(response.data);
      print("res: ${res.results.toString()}");
      return res;
    } catch (e) {
      print("Error fetching movies");
      print(e);
      return null;
    }
  }

  Future<MovieDetailsResponse?> getMovieDetails(int movieId) async {
    try {
      var response = await dio.get('movie/$movieId');
      final res = MovieDetailsResponse.fromJson(response.data);
      return res;
    } catch (e) {
      print("Error fetching details");
      return null;
    }
  }

  Future<MovieVideosResponse?> getMovieVideos(int movieId) async {
    try {
      var response = await dio.get('movie/$movieId/videos');
      final res = MovieVideosResponse.fromJson(response.data);
      return res;
    } catch (e) {
      print("Error fetching movie videos");
      return null;
    }
  }
}
