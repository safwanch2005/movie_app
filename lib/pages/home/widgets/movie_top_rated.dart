import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Api/api.dart';
import 'package:movie_app/Api/constands.dart';
import 'package:movie_app/Api/model.dart';
import 'package:movie_app/pages/detailed_page/detailed_page.dart';

class TopRated extends StatefulWidget {
  const TopRated({super.key});

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  final MovieService _movieService = MovieService();
  List<ApiDataModel> topRatedMovies = [];
  @override
  void initState() {
    super.initState();
    loadNewReleases();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 20, left: 35),
          child: Text(
            "Top Rated Movies",
            style: GoogleFonts.racingSansOne(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: 2,
              horizontal: MediaQuery.of(context).size.width * 0.03),
          height: MediaQuery.of(context).size.height * 0.22,
          width: 500,
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(30),
          //     border: Border.all(color: Colors.white, width: 5)),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRatedMovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailedPage(
                                movie: topRatedMovies[index],
                              )),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white54, width: 2.5),
                    ),
                    //  height: 100,
                    // width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "${Constants.imagePath}${topRatedMovies[index].poster}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Future<void> loadNewReleases() async {
    try {
      final movies = await _movieService.getMovies(Constants.topratedMovies);
      setState(() {
        topRatedMovies = movies;
      });
    } catch (e) {
      // Handle errors
      // ignore: avoid_print
      print('Error loading new releases: $e');
    }
  }
}
