import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Api/api.dart';
import 'package:movie_app/Api/constands.dart';
import 'package:movie_app/Api/model.dart';
import 'package:movie_app/pages/detailed_page/detailed_page.dart';

class TvTopRated extends StatefulWidget {
  const TvTopRated({super.key});

  @override
  State<TvTopRated> createState() => _TvTopRatedState();
}

class _TvTopRatedState extends State<TvTopRated> {
  final MovieService _movieService = MovieService();
  List<ApiDataModel> topRatedTv = [];
  @override
  void initState() {
    super.initState();
    loadTvTopRated();
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
            "Top Rated TV Shows",
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
              itemCount: topRatedTv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailedPage(
                                movie: topRatedTv[index],
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
                        "${Constants.imagePath}${topRatedTv[index].poster}",
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

  Future<void> loadTvTopRated() async {
    try {
      final tv = await _movieService.getMovies(Constants.topRatedTv);
      setState(() {
        topRatedTv = tv;
      });
    } catch (e) {
      // Handle errors
      // ignore: avoid_print
      print('Error loading new releases: $e');
    }
  }
}
