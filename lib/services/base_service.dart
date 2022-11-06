import 'package:dio/dio.dart';

const apiKey ="";

abstract class BaseService {
  static String baseUrl = "https://api.themoviedb.org/3/";

  final String posterUrl = "https://image.tmdb.org/t/p/original/";
  final String thumbNailUrl = "https://image.tmdb.org/t/p/w500/";

  final dio = createDio();

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
      headers: {
        "Authorization" : "Bearer $apiKey"
      }
    ));

    return dio;
  }
}
