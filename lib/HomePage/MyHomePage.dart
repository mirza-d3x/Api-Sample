import 'dart:convert';
import 'package:apisample/MovieDetails/ScreenMovieDetails.dart';
import 'package:apisample/HomePage/testModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
String baseUrl = "https://image.tmdb.org/t/p/w185";
class _MyHomePageState extends State<MyHomePage> {
  TestModel? testModel;
  bool loading = true;


  Future<TestModel> fetchTrending() async {
    Response response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/all/day?api_key=a5621ef03b6cb42a8c1ffb828d33ba8c'));
    print(response.statusCode);
    print(response.body);
    // setState(() {
    //   testModel = TestModel.fromJson(jsonDecode(response.body));
    // });

    return TestModel.fromJson(jsonDecode(response.body));
  }

  @override
  void initState() {
    fetchTrending().then(
      (value) {
        setState(() {
          testModel = value;
          loading = false;
        });
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Movie DB"),
        centerTitle: true,
      ),
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: testModel!.results!.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScreenMovieDetails(id: testModel!.results![index].id.toString()),
                            ));
                      },
                      child: Container(
                        // height: MediaQuery.of(context).size.height / 3,
                        // width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(
                              baseUrl +
                                  testModel!.results![index].posterPath
                                      .toString(),
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment(0, 1),
                          child: Text(
                            testModel!.results![index].originalTitle.toString(),
                            style: TextStyle(
                              backgroundColor: Colors.grey.withOpacity(0.5),
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}

//Image.network("https://image.tmdb.org/t/p/w185"+testModel!.results![index].posterPath.toString());

//Text(testModel!.results![0].originalTitle.toString())
//ListView.separated(itemBuilder: (BuildContext context, int index){
//           return ListTile(
//             title: Text(testModel!.results![index].originalTitle.toString()),
//           );
//         },
//             separatorBuilder: (context, index){return Divider();},
//             itemCount: testModel!.results!.length)
//










//https://api.themoviedb.org/3/movie/799876?api_key=a5621ef03b6cb42a8c1ffb828d33ba8c&language=en-US