import 'package:flutter/material.dart';
import 'package:flutter_movie_app/network/http_movie_data_agent_impl.dart';
import 'package:flutter_movie_app/network/retrofit_data_agent_impl.dart';
import 'package:flutter_movie_app/pages/home_page.dart';
import 'package:flutter_movie_app/pages/movie_detail_page.dart';

import 'network/dio_movie_data_agent_impl.dart';

void main() {
 RetrofitDataAgentImpl().getNowPlayingMovie(1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage()
    );
  }
}



