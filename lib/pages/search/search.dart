import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Api/api.dart';
import 'package:movie_app/Api/constands.dart';
import 'package:movie_app/Api/model.dart';
import 'package:movie_app/pages/detailed_page/detailed_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final MovieService _movieService = MovieService();
  List<ApiDataModel> searchPage = [];
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
                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 20),
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'search',
                      hintStyle: GoogleFonts.racingSansOne(
                          color: Colors.white60, fontSize: 25),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 5, color: Colors.white60),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 25),
                      itemCount: searchPage.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailedPage(
                                        movie: searchPage[index],
                                      )),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "${Constants.imagePath}${searchPage[index].poster}",
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
      final movie = await _movieService.getMovies(Constants.allMovies);

      if (_mounted) {
        setState(() {
          searchPage.addAll(tv + movie + topRatedTv);
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
