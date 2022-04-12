import 'dart:convert';

import 'package:apisample/MovieDetails/MovieModel.dart';
import 'package:apisample/Provider/ApiClient.dart';
import 'package:http/http.dart';

class MoviesApi{
ApiClient apiClient = ApiClient();
 String trendingpath = "trending/movie/day";

 Future<MovieDetailsModel> getTrendingMovies() async{

   Response response = await apiClient.invokeApi(trendingpath, 'GET', null);
   return MovieDetailsModel.fromJson(jsonDecode(response.body));
 }
}