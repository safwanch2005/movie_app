import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Api/constands.dart';
import 'package:movie_app/Api/model.dart';

class DetailedPage extends StatelessWidget {
  final ApiDataModel movie;
  const DetailedPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image.network(
                  "${Constants.imagePath}${movie.poster}",
                  fit: BoxFit.cover,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        "${Constants.imagePath}${movie.poster}",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      movie.movieName ?? "",
                      style: GoogleFonts.racingSansOne(
                          color: Colors.white, fontSize: 50),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Description:  ${movie.overview ?? ''}',
                      style: GoogleFonts.racingSansOne(
                          fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Rating:  ${movie.averageRating ?? 0.0}',
                      style: GoogleFonts.racingSansOne(
                          fontSize: 25, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
