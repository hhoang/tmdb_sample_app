import 'package:flutter/material.dart';
import 'package:imdb/models/movie_details_response.dart';
import 'package:imdb/models/movie_videos_response.dart';
import 'package:imdb/services/movie_service.dart';
import 'package:imdb/viewmodels/home_view_model.dart';

class DetailViewModel with ChangeNotifier {
  int movieId;
  DetailViewModel(this.movieId);

  Status _detailStatus = Status.INITIAL;

  Status get status {
    return _detailStatus;
  }
  MovieDetailsResponse? movieDetailsResponse;
  MovieVideosResponse? movieVideosResponse;

  fetchMoviesList() async {
    _detailStatus = Status.LOADING;
    notifyListeners();
    try {
      print("fetching movie: $movieId");
      movieDetailsResponse = await MovieService().getMovieDetails(movieId);
      movieVideosResponse = await MovieService().getMovieVideos(movieId);
      _detailStatus = Status.COMPLETED;
    } catch (e) {
      _detailStatus = Status.ERROR;
      print(e);
    }
    notifyListeners();
  }

}