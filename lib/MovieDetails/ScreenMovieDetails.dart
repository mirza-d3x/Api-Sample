import 'package:apisample/HomePage/MyHomePage.dart';
import 'package:apisample/Provider/MovieDetails/movieDetailProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenMovieDetails extends StatefulWidget {
  const ScreenMovieDetails({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<ScreenMovieDetails> createState() => _ScreenMovieDetailsState();
}

class _ScreenMovieDetailsState extends State<ScreenMovieDetails> {
  @override
  void initState() {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.getMovieDetails(context, widget.id);

    // TODO: implement initState
    super.initState();
  }

  bool toggleTF = false;

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<MovieProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: providerData.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .40,
                    width: MediaQuery.of(context).size.width * .30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          baseUrl +
                              providerData.movieDetailsModel.posterPath
                                  .toString(),
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    providerData.movieDetailsModel.title.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "RunTime:" +
                            providerData.movieDetailsModel.runtime.toString() +
                            " min",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Release Date" +
                            providerData.movieDetailsModel.releaseDate
                                .toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Average Vote" +
                            providerData.movieDetailsModel.voteAverage
                                .toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        providerData.movieDetailsModel.overview.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            overflow: toggleTF
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis),
                        maxLines: toggleTF ? null : 2,
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              toggleTF = !toggleTF;
                            });
                          },
                          child: Text(
                            toggleTF ? "Show less" : "Show more",
                          ))
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
