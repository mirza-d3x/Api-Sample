import 'package:apisample/HomePage/MyHomePage.dart';
import 'package:apisample/MovieDetails/MovieDetailsModel.dart';
import 'package:apisample/MovieDetails/fetchdetails.dart';
import 'package:flutter/material.dart';

class ScreenMovieDetails extends StatelessWidget {
  const ScreenMovieDetails({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    bool isReadmore = false;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: fetchMovieDetails(id),
            builder: (BuildContext context,
                AsyncSnapshot<MovieDetailsModel> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(
                              baseUrl + snapshot.data!.posterPath.toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Text(
                                snapshot.data!.title.toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                ),
                              ),

                              Text(
                                snapshot.data!.overview.toString(),
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Average Vote" + snapshot.data!.voteAverage.toString(),
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
