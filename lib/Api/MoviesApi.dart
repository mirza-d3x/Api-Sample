import 'dart:convert';
import 'package:apisample/HomePage/Model/TrendingModel.dart';
import 'package:apisample/MovieDetails/Model/MovieModel.dart';
import 'package:apisample/Api/ApiClient.dart';
import 'package:http/http.dart';

class MoviesApi{
ApiClient apiClient = ApiClient();
 String trendingpath = "trending/movie/day";
 String moviePath = "movie/";

 Future<MovieDetailsModel> getMoviesDetails(String id) async{

   Response response = await apiClient.invokeApi(moviePath+id, 'GET', null);
   return MovieDetailsModel.fromJson(jsonDecode(response.body));
 }

Future<TrendingModel> getTrendingMovie() async{

  Response response = await apiClient.invokeApi(trendingpath, 'GET', null);
  return TrendingModel.fromJson(jsonDecode(response.body));
}
}