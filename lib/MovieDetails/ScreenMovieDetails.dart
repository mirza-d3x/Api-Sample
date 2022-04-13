import 'package:apisample/HomePage/MyHomePage.dart';
import 'package:apisample/Provider/providertrending.dart';
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
    final trendingProvider =
        Provider.of<TrendingProvider>(context, listen: false);
    trendingProvider.getMovieDetails(context, widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<TrendingProvider>(context);
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
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width * .50,
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
                  )
                ],
              ),
      ),
    );
  }
}
// FutureBuilder(
// future: fetchMovieDetails(widget.id),
// builder: (BuildContext context,
//     AsyncSnapshot<MovieDetailsModel>
// snapshot) {
// if (snapshot.hasData) {
// return Container(
// color: Colors.black,
// height: MediaQuery.of(context)
//     .size
//     .height,
// width: MediaQuery.of(context)
//     .size
//     .width,
// child: ListView(
// children: [
// Column(
// mainAxisAlignment:
// MainAxisAlignment
//     .start,
// children: [
// const SizedBox(
// height: 30,
// ),
// Container(
// height: MediaQuery.of(
// context)
//     .size
//     .height /
// 2.5,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius
//     .circular(
// 10)),
// child: Image.network(
// baseUrl +
// snapshot.data!
//     .posterPath
//     .toString(),
// fit: BoxFit.fill,
// ),
// ),
// const SizedBox(
// height: 10),
// Column(
// children: [
// Text(
// snapshot
//     .data!.title
//     .toString(),
// textAlign:
// TextAlign
//     .center,
// style:
// const TextStyle(
// fontSize: 26,
// color: Colors
//     .white,
// ),
// ),
// SizedBox(
// height: 30,
// ),
// Text(
// snapshot.data!
//     .overview
//     .toString(),
// style:
// const TextStyle(
// fontSize: 20,
// color: Colors
//     .white,
// ),
// maxLines:
// isReadmore
// ? null
//     : 1,
// overflow: isReadmore
// ? TextOverflow
//     .visible
//     : TextOverflow
//     .ellipsis,
// ),
// TextButton(
// onPressed: () {
// setState(() {
// isReadmore =
// !isReadmore;
// print(isReadmore);
// });
// },
// child: Text((isReadmore
// ? "Read Less"
//     : "Read More"))),
// Text(
// "Average Vote" +
// snapshot.data!
//     .voteAverage
//     .toString(),
// style:
// const TextStyle(
// fontSize: 26,
// color: Colors
//     .white,
// ),
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// );
// }
// return const Center(
// child:
// CircularProgressIndicator());
// }),
