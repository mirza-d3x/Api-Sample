import 'package:apisample/Api/MoviesApi.dart';
import 'package:apisample/Model/TvShowsModel.dart';
import 'package:flutter/cupertino.dart';

class TvShowsProvider with ChangeNotifier {
  TvshowsModel tvshowsModel = TvshowsModel();
  MoviesApi moviesApi = MoviesApi();

  bool loading = false;

  getTvShowData(context) async {
    loading = true;
    tvshowsModel = await moviesApi.getTvShows();
    loading = false;
    notifyListeners();
  }
}
