import 'package:film/pages/MoviePage.dart';
import 'package:film/services/api_data.dart';
import 'package:film/wigets/CustomNavBar.dart';
import 'package:flutter/material.dart';

class SeeAllWidget extends StatefulWidget {
  final bool newMovie;
  SeeAllWidget({required this.newMovie});

  @override
  State<SeeAllWidget> createState() => _SeeAllWidget();
}

class _SeeAllWidget extends State<SeeAllWidget> {
  var jsonList;
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      if (widget.newMovie == true) {
        jsonList = await Movie().getNewMovie();
      } else {
        jsonList = await Movie().getUpComingMovie();
      }
      setState(() {});
    } catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      // Kembali ke HomePage
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    widget.newMovie ? "New Movies" : "Upcoming Movies",
                    // "New Movies",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: jsonList != null
                  ? ListView.builder(
                      itemCount: jsonList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MoviePage(movie: jsonList[index]),
                              ),
                            );
                          },
                          child: Container(
                            width: 190,
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color(0xFF292B37),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF292B37).withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      jsonList[index]['cover'],
                                      height: 100,
                                      width: 90,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        jsonList[index]['judul'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        jsonList[index]['genre'],
                                        style: TextStyle(
                                          color: Colors.white54,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            jsonList[index]['nilai'],
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 16,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 23,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
