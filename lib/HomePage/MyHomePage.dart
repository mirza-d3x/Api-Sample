import 'package:apisample/Model/TrendingModel.dart';
import 'package:apisample/MovieDetails/ScreenMovieDetails.dart';
import 'package:apisample/Provider/TrendingProvider/providertrending.dart';
import 'package:apisample/Provider/TvShowsProvider/tvShowsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String baseUrl = "https://image.tmdb.org/t/p/w185";

class _MyHomePageState extends State<MyHomePage> {
  TrendingModel? testModel;
  bool loading = true;

  @override
  void initState() {
    final trendingProvider =
        Provider.of<TrendingProvider>(context, listen: false);
    trendingProvider.getTrendingMovieData(context);

    final tvShowsProvider =
        Provider.of<TvShowsProvider>(context, listen: false);
    tvShowsProvider.getTvShowData(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final trendingProvider = Provider.of<TrendingProvider>(context);
    final tvshowsProvider =
        Provider.of<TvShowsProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("The Movie DB"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Top Rated Tv Shows",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  tvshowsProvider.loading
                      ? const Center(child: CircularProgressIndicator())
                      : LimitedBox(
                          maxHeight: 350,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                trendingProvider.trendingModel.results!.length,
                            itemBuilder: ((BuildContext context, index) =>
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .30,
                                  width:
                                      MediaQuery.of(context).size.width * .60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(baseUrl +
                                              tvshowsProvider.tvshowsModel
                                                  .results![index].posterPath
                                                  .toString()),
                                          fit: BoxFit.cover)),
                                )),
                          ),
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Top Rated Tv Shows",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: trendingProvider.loading
                        ? const Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            itemCount:
                                trendingProvider.trendingModel.results!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 20,
                                    childAspectRatio: .65,
                                    mainAxisSpacing: 20),
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => ScreenMovieDetails(
                                      id: trendingProvider
                                          .trendingModel.results![index].id
                                          .toString(),
                                    ),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(baseUrl +
                                              trendingProvider.trendingModel
                                                  .results![index].posterPath
                                                  .toString()))),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
