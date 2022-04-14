import 'package:apisample/HomePage/MyHomePage.dart';
import 'package:apisample/Provider/MovieDetails/movieDetailProvider.dart';
import 'package:apisample/Provider/TrendingProvider/providertrending.dart';
import 'package:apisample/Provider/TvShowsProvider/tvShowsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<TrendingProvider>(create: (_) => TrendingProvider(),),
    ChangeNotifierProvider<MovieProvider>(create: (_)=> MovieProvider(),),
    ChangeNotifierProvider<TvShowsProvider>(create: (_)=> TvShowsProvider(),),

  ],
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const MyHomePage(),
    );
  }
}

