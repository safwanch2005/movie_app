import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/pages/first_page/login_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstPage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(23)),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: ListTile(
                trailing: const Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                ),
                leading: Text(
                  'log out',
                  style: GoogleFonts.racingSansOne(
                      color: Colors.black, fontSize: 30),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              SystemNavigator.pop();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(23)),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 120),
              child: ListTile(
                trailing: const Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ),
                leading: Text(
                  'Exit app',
                  style: GoogleFonts.racingSansOne(
                      color: Colors.black, fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
