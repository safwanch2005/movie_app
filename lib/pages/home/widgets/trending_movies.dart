import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Api/api.dart';
import 'package:movie_app/Api/constands.dart';
import 'package:movie_app/Api/model.dart';
import 'package:movie_app/pages/detailed_page/detailed_page.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({super.key});

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  List<ApiDataModel> trendingMovies = [];
  final MovieService _movieService = MovieService();

  @override
  void initState() {
    super.initState();
    loadTrendingMovies();
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
            "Trending Movies Now",
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
              itemCount: trendingMovies.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailedPage(
                                movie: trendingMovies[index],
                              )),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white54, width: 2.5),
                    ),
                    //height: 200,
                    // width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                          '${Constants.imagePath}${trendingMovies[index].poster}'),
                    ),
                  ),
                );
              }),
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }

  Future<void> loadTrendingMovies() async {
    try {
      final movies = await _movieService.getMovies(Constants.trendingMovies);
      setState(() {
        trendingMovies = movies;
      });
    } catch (e) {
      // Handle errors
      // ignore: avoid_print
      print('Error loading trending movies: $e');
    }
  }
}
