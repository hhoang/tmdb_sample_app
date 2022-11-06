import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb/models/movie.dart';
import 'package:imdb/models/now_playing_response.dart';
import 'package:imdb/services/base_service.dart';
import 'package:imdb/viewmodels/details_view_model.dart';
import 'package:imdb/viewmodels/home_view_model.dart';
import 'package:imdb/views/details.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer<HomeViewModel>(builder: (context, homeViewModel, _) {
      if (homeViewModel.status == Status.INITIAL) {
        return Container(
          color: Colors.black,
        );
      } else if (homeViewModel.status == Status.LOADING) {
        return Container(
          color: Colors.black,
          child: const CircularProgressIndicator(),
        );
      } else if (homeViewModel.status == Status.COMPLETED) {
        return SafeArea(
          child: Container(
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Text(
                      "Now Playing",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ...moviesList(homeViewModel.nowPlaying!),
                ],
              ),
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }

  List<Widget> moviesList(NowPlayingResponse nowPlaying) {
    if (nowPlaying.results == null) {
      return [];
    }
    return nowPlaying.results!.map(
      (movie) {
        return _movieEntry(movie);
      },
    ).toList();
  }

  Widget _movieEntry(Movie movie) {
    return InkWell(
      onTap: () => _navigateToMovie(movie),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFF242435),
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(14))),
        margin: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
              child: CachedNetworkImage(
                width: 120,
                imageUrl: "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    movie.title ?? "No title",
                    style: GoogleFonts.openSans(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    " \u{2605} ${movie.voteAverage}",
                    style: const TextStyle(color: Colors.yellow, fontSize: 12),
                  ),
                  Text(
                    "${movie.overview}",
                    maxLines: 4,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _navigateToMovie(Movie movie) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (_) => DetailViewModel(movie.id!)..fetchMoviesList(),
          child: const Details(),
        ),
      ),
    );
  }
}
