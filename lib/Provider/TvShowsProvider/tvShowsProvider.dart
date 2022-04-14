import 'package:apisample/Api/MoviesApi.dart';
import 'package:apisample/Model/TvShowModel.dart';

import 'package:flutter/cupertino.dart';

class TvShowsProvider with ChangeNotifier {
  TvShowModel tvshowsModel = TvShowModel();
  MoviesApi moviesApi = MoviesApi();

  bool loading = false;

  getTvShowData(context) async {
    loading = true;
    tvshowsModel = await moviesApi.getTvShows();
    loading = false;
    notifyListeners();
  }
}
