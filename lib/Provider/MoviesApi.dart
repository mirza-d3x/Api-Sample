import 'dart:convert';
import 'package:apisample/HomePage/testModel.dart';
import 'package:apisample/MovieDetails/MovieModel.dart';
import 'package:apisample/Provider/ApiClient.dart';
import 'package:http/http.dart';

class MoviesApi{
ApiClient apiClient = ApiClient();
 String trendingpath = "trending/movie/day";
 String moviePath = "movie/";

 Future<MovieDetailsModel> getMoviesDetails(String id) async{

   Response response = await apiClient.invokeApi(moviePath+id, 'GET', null);
   return MovieDetailsModel.fromJson(jsonDecode(response.body));
 }

Future<TestModel> getTrendingMovie() async{

  Response response = await apiClient.invokeApi(trendingpath, 'GET', null);
  return TestModel.fromJson(jsonDecode(response.body));
}
}