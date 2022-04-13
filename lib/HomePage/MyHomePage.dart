
import 'package:apisample/HomePage/testModel.dart';
import 'package:apisample/MovieDetails/ScreenMovieDetails.dart';
import 'package:apisample/Provider/providertrending.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String baseUrl = "https://image.tmdb.org/t/p/w185";

class _MyHomePageState extends State<MyHomePage> {
  TestModel? testModel;
  bool loading = true;
  @override
  void initState() {
    final trendingProvider =
        Provider.of<TrendingProvider>(context, listen: false);
    trendingProvider.getMovieData(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final trendingProvider = Provider.of<TrendingProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("The Movie DB"),
          centerTitle: true,
        ),
        body: trendingProvider.loading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(itemCount: trendingProvider.testModel.results!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                crossAxisSpacing: 20,
                childAspectRatio: .65,
                mainAxisSpacing: 20),

                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => ScreenMovieDetails(
                            id: trendingProvider.testModel.results![index].id
                                .toString()))),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(baseUrl +
                                  trendingProvider
                                      .testModel.results![index].posterPath
                                      .toString()))),
                    ),
                  );
                }));
  }
}
