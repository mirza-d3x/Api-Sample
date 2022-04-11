import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ApiClient{
static final String basePath = "https://api.themoviedb.org/3/";
String apiKey = "a5621ef03b6cb42a8c1ffb828d33ba8c";

Future<Response> invokeApi(String path, String method, Object? body) async{
Map<String, String> headerparams = {};
Response response;

String url = basePath + path +'?api_key=$apiKey';

final nullableHeaderParams = (headerparams.isEmpty)?null :headerparams;


switch (method) {
 case "POST":
   response = await post(Uri.parse(url), headers: {"content-Type": "application/json",},body: body);
   break;
}
}
}
