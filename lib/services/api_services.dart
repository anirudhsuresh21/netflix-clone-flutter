import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone/common/utils.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/models/MovieRecommendationsModel.dart';
import 'package:netflix_clone/models/cast_details.dart';
import 'package:netflix_clone/models/cast_tv.dart';
import 'package:netflix_clone/models/movie_details_model.dart';
import 'package:netflix_clone/models/search_model.dart';
import 'package:netflix_clone/models/tvModel.dart';
import 'package:netflix_clone/models/tv_series.dart';
import 'package:netflix_clone/models/upcoming_movies.dart';

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endPoint;

class ApiServices{

  Future<UpcomingMovies> getUpcomingMovies() async{
    endPoint ="movie/upcoming";
    final url ="$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url)); 

    if(response.statusCode==200){
      log("Success + ${response.body}");
      return UpcomingMovies.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to Load Upcoming Movies");
  }
    Future<UpcomingMovies> getNowPlayingMovies() async{
    endPoint ="movie/now_playing";
    final url ="$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url)); 

    if(response.statusCode==200){
      log("-----------------------------------------------------------------------------------------------------");
      log("Success + ${response.body}");
      return UpcomingMovies.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to Load Now Playing Movies");
  }

  Future<TvSeries> getTopRatedSeries() async{
    endPoint ="tv/top_rated";
    final url ="$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url)); 

    if(response.statusCode==200){
      log("-----------------------------------------------------------------------------------------------------");
      log("Success + ${response.body}");
      return TvSeries.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to Load Now Playing Movies");
  }

  Future<SearchModel> getSearchResults(String searchText) async{
    endPoint ="search/multi?query=$searchText";
    final url = '$baseUrl$endPoint';
    print(url);
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YzJhODJiZDBmYjFiNWIzMmZhYWY5MGM5MzlmYjNmNSIsInN1YiI6IjY2M2E1NjllOTU5MGUzMDEyOWJlMzU0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RhE37VLoUR2W3i_CzRcGFNsXQ3b8naO1SI4DDP2zTlc'
    });
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log('success');
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  search movie ');
  }

  Future<MovieRecommendationsModel> getPopularMovies() async {
    endPoint = 'movie/popular';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      log('success');
      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    endPoint = 'movie/$movieId';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }

  Future<MovieRecommendationsModel> getMovieRecommendations(int movieId) async {
    endPoint = 'movie/$movieId/recommendations';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }

   Future<CastModel> getCastDetails(int movieId) async {
    endPoint = 'movie/$movieId/credits';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return CastModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }
  Future<TvModel> getTvDetails(int movieId) async {
    endPoint = 'tv/$movieId';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log("Success + ${response.body}");
      return TvModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }
  Future<TvSeriesCast> getCastDetailstv(int movieId) async {
    endPoint = 'tv/$movieId/credits';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return TvSeriesCast.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }
}