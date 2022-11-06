import 'package:flutter/cupertino.dart';
import 'package:imdb/models/now_playing_response.dart';
import 'package:imdb/services/movie_service.dart';

enum Status { INITIAL, LOADING, COMPLETED, ERROR }

class HomeViewModel with ChangeNotifier {
  Status _homeStatus = Status.INITIAL;

  Status get status {
    return _homeStatus;
  }
  NowPlayingResponse? nowPlaying;

  fetchMoviesList() async {
    _homeStatus = Status.LOADING;
    notifyListeners();
    try {
      print("fetching movies");
      nowPlaying = await MovieService().getNowPlayingMovies();
      _homeStatus = Status.COMPLETED;
      print("complete");
      // _apiResponse = ApiResponse.completed(mediaList);
    } catch (e) {
      _homeStatus = Status.ERROR;
      print(e);
    }
    notifyListeners();
  }

}
