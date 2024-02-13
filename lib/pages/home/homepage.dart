import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/pages/home/widgets/flutter_gallery.dart';
import 'package:movie_app/pages/home/widgets/movie_top_rated.dart';
import 'package:movie_app/pages/home/widgets/trending_movies.dart';
import 'package:movie_app/pages/home/widgets/tv_top_rated.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset("assets/background.png", fit: BoxFit.fill)),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.001),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          ListView(
            children: const [
              FlutterGallery(),
              TvTopRated(),
              TopRated(),
              TrendingMovies(),
            ],
          ),
        ],
      ),
    );
  }
}
