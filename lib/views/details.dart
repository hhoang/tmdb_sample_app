import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imdb/models/movie_details_response.dart';
import 'package:imdb/models/movie_videos_response.dart';
import 'package:imdb/models/videos_response.dart';
import 'package:imdb/viewmodels/details_view_model.dart';
import 'package:imdb/viewmodels/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late int movieId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<DetailViewModel>(builder: (context, detailViewModel, _) {
      if (detailViewModel.status == Status.INITIAL) {
        return Container();
      } else if (detailViewModel.status == Status.COMPLETED) {
        var movie = detailViewModel.movieDetailsResponse!;
        var videos = detailViewModel.movieVideosResponse;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeroImage(movie),
              _buildGenres(movie),
              const SizedBox(height: 20),
              _buildMovieDescription(movie),
              const SizedBox(height: 20),
              Text(
                "Videos",
                textAlign: TextAlign.left,
                style: GoogleFonts.robotoCondensed(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 10),
              _buildThumbnails(videos),
              const SizedBox(height: 24),
            ],
          ),
        );
      } else {
        return Container();
      }
    });
  }

  _buildHeroImage(MovieDetailsResponse movie) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
          stops: [.5, 1],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: CachedNetworkImage(
        imageUrl: "https://image.tmdb.org/t/p/original${movie.posterPath}",
        placeholder: (context, url) =>
        const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  _buildMovieDescription(MovieDetailsResponse movie) {
    return Container(
      child: Text(
        movie.overview ?? "",
        textAlign: TextAlign.center,
        style: GoogleFonts.robotoCondensed(
          textStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w900, fontSize: 16),
        ),
      ),
    );
  }

  _buildGenres(MovieDetailsResponse movie) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...movie.genres?.map(
              (genre) => Text(
                " ${genre.name} ${genre.name != movie.genres?.last.name ? "," : ""}" ??
                    "",
                style: GoogleFonts.robotoCondensed(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14),
                ),
              ),
            ) ??
            []
      ],
    );
  }

  _buildThumbnails(MovieVideosResponse? videos) {
    if (videos == null) {
      return Container();
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...videos.results!.where((video) => video.site == "YouTube").map(
                (video) => InkWell(
                  onTap: () => _launchYoutubeLink(video),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: CachedNetworkImage(
                        width: 300,
                        imageUrl:
                            "https://img.youtube.com/vi/${video.key}/mqdefault.jpg",
                        placeholder: (context, url) =>
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        // imageBuilder: (context, imageProvider) => PhotoView(
                        //   imageProvider: imageProvider,
                        // ),
                      ),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }

  _launchYoutubeLink(VideosResponse video) {
    launchUrl(Uri.parse("https://www.youtube.com/watch?v=${video.key!}"));
  }
}
