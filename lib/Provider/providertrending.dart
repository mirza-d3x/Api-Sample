import 'package:apisample/HomePage/testModel.dart';
import 'package:apisample/MovieDetails/MovieModel.dart';
import 'package:apisample/Provider/MoviesApi.dart';
import 'package:flutter/cupertino.dart';

class TrendingProvider with ChangeNotifier{
  MovieDetailsModel movieDetailsModel = MovieDetailsModel();
TestModel testModel = TestModel();
MoviesApi moviesApi = MoviesApi();

bool loading =false;

getMovieData(context) async{
  loading = true;
  testModel = await moviesApi.getTrendingMovie();
  loading = false;
  notifyListeners();
}
getMovieDetails(context,String id) async{
  loading = true;
  movieDetailsModel = await moviesApi.getMoviesDetails(id);
  loading = false;
  notifyListeners();
}

}