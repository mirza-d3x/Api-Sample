import 'package:apisample/Model/MovieModel.dart';
import 'package:apisample/Api/MoviesApi.dart';
import 'package:flutter/cupertino.dart';

class MovieProvider with ChangeNotifier{
  MovieDetailsModel movieDetailsModel = MovieDetailsModel();
  MoviesApi moviesApi = MoviesApi();

  bool loading =false;


  getMovieDetails(context,String id) async{
    loading = true;
    movieDetailsModel = await moviesApi.getMoviesDetails(id);
    loading = false;
    notifyListeners();
  }

}