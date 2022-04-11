import 'dart:convert';

import 'package:apisample/MovieDetails/MovieDetailsModel.dart';
import 'package:http/http.dart' as http;

Future<MovieDetailsModel> fetchMovieDetails(String id) async {
 final responseDetails = await http.get(Uri.parse(
      "https://api.themoviedb.org/3/movie/$id?api_key=a5621ef03b6cb42a8c1ffb828d33ba8c&language=en-US"));
 print(responseDetails.body);
 print(responseDetails.statusCode);
  return MovieDetailsModel.fromJson(jsonDecode(responseDetails.body));
}
