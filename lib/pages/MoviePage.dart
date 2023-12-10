// import 'dart:ffi';

import 'package:film/services/api_data.dart';
import 'package:film/wigets/CastWidget.dart';
import 'package:film/wigets/CustomNavBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviePage extends StatefulWidget {
  final dynamic movie;
  MoviePage({required this.movie});

  @override
  State<MoviePage> createState() => _MoviePage();
}

class _MoviePage extends State<MoviePage> {
  String uuid = '';
  bool isFavorite = false;
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final dynamic movie = widget.movie;
    String movie_id = movie['id'].toString();

    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      setState(() {
        uuid = user.uid;
      });
    }
    try {
      isFavorite = await Movie().checkFavorite(uuid, movie_id);
      setState(() {});
    } catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final dynamic movie = widget.movie;
    return Scaffold(
      body: movie != null
          ? Stack(
              children: [
                Opacity(
                  opacity: 0.4,
                  child: Image.network(
                    movie['sampul'],
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Movie()
                                        .toggleFavorite(isFavorite, uuid,
                                            movie['id'].toString())
                                        .then((newValue) {
                                      setState(() {
                                        isFavorite = newValue;
                                      });
                                    });
                                  },
                                  child: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        isFavorite ? Colors.red : Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 50),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.red.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                        )
                                      ]),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      movie['cover'],
                                      height: 250,
                                      width: 180,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 50, top: 45),
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.red,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 8,
                                      ),
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      if (!await launchUrl(
                                          Uri.parse(movie['trailer']))) {
                                        throw Exception(
                                            'Could not launch ${movie['trailer']}');
                                      }
                                    },
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.only(
                                top: 20, bottom: 5, left: 10, right: 10),
                            width: double.infinity,
                            height: 403,
                            child: SingleChildScrollView(
                              physics: AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie['judul'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    movie['deskripsi'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  SizedBox(height: 20),
                                  CastWidget(casts: movie['casts']),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            )
          : Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
