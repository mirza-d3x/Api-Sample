import 'package:apisample/HomePage/testModel.dart';
import 'package:apisample/MovieDetails/MovieModel.dart';
import 'package:apisample/Provider/MoviesApi.dart';
import 'package:flutter/cupertino.dart';

class TrendingProvider with ChangeNotifier{
MovieDetailsModel movieDetailsModel = MovieDetailsModel();
MoviesApi moviesApi = MoviesApi();

bool loading =false;

getMovieData(context) async{
  loading = true;
  movieDetailsModel = await moviesApi.getTrendingMovies();
  loading = false;
  notifyListeners();
}

}