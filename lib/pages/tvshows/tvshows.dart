import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Api/api.dart';
import 'package:movie_app/Api/constands.dart';
import 'package:movie_app/Api/model.dart';
import 'package:movie_app/pages/detailed_page/detailed_page.dart';

class AllTvShows extends StatefulWidget {
  const AllTvShows({super.key});

  @override
  State<AllTvShows> createState() => _AllTvShowsState();
}

class _AllTvShowsState extends State<AllTvShows> {
  final MovieService _movieService = MovieService();
  List<ApiDataModel> allTv = [];
  bool _mounted = false;
  @override
  void initState() {
    super.initState();
    _mounted = true;
    loadNewReleases();
  }

  @override
  void dispose() {
    _mounted = false; // Set mounted flag to false when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "All TV Shows",
                    style: GoogleFonts.racingSansOne(
                        fontSize: 50, color: Colors.white),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 25),
                      itemCount: allTv.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailedPage(
                                        movie: allTv[index],
                                      )),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: Colors.white30, width: 2.5),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${Constants.imagePath}${allTv[index].poster}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadNewReleases() async {
    try {
      final tv = await _movieService.getMovies(Constants.trendingTv);
      final topRatedTv = await _movieService.getMovies(Constants.topRatedTv);

      if (_mounted) {
        setState(() {
          allTv.addAll(tv + topRatedTv);
        });
      }
    } catch (e) {
      // Handle errors
      // ignore: avoid_print
      if (_mounted) {
        print('Error loading new releases: $e');
      }
      print('Error loading new releases: $e');
    }
  }
}
