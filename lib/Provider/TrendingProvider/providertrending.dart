import 'package:apisample/Model/TrendingModel.dart';
import 'package:apisample/Model/MovieModel.dart';
import 'package:apisample/Api/MoviesApi.dart';
import 'package:flutter/cupertino.dart';

class TrendingProvider with ChangeNotifier{
TrendingModel trendingModel = TrendingModel();
MoviesApi moviesApi = MoviesApi();

bool loading =false;

getTrendingMovieData(context) async{
  loading = true;
  trendingModel = await moviesApi.getTrendingMovie();
  loading = false;
  notifyListeners();
}


}