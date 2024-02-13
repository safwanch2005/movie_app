import 'package:flutter/material.dart';
import 'package:movie_app/pages/home/homepage.dart';
import 'package:movie_app/pages/movies/movies.dart';
import 'package:movie_app/pages/search/search.dart';
import 'package:movie_app/pages/settings/setting.dart';
import 'package:movie_app/pages/tvshows/tvshows.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static int pageIndex = 0;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = const [
    HomePage(),
    MoviesPage(),
    SearchPage(),
    AllTvShows(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            pages[Home.pageIndex],
            Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width * 0.68,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white),
                  color: Colors.black,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttons(Icons.home, 0),
                    buttons(Icons.movie, 1),
                    buttons(Icons.search, 2),
                    buttons(Icons.tv, 3),
                    buttons(Icons.settings, 4)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buttons(IconData iconData, int index) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white, width: Home.pageIndex == index ? 5 : 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            Home.pageIndex = index;
          });
        },
        icon: Icon(
          iconData,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
