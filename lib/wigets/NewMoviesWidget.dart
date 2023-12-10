import 'package:film/pages/MoviePage.dart';
import 'package:film/services/api_data.dart';
import 'package:film/wigets/SeeAllWidget.dart';
import 'package:flutter/material.dart';

class NewMoviesWidget extends StatefulWidget {
  const NewMoviesWidget({super.key});

  @override
  State<NewMoviesWidget> createState() => _NewMoviesWidget();
}

class _NewMoviesWidget extends State<NewMoviesWidget> {
  var jsonList;
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      jsonList = await Movie().getNewMovie();
      setState(() {});
    } catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Movies",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeAllWidget(newMovie: true),
                    ),
                  );
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 300, // Set the height of the ListView
          child: jsonList != null
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: jsonList.length,
                  itemBuilder: (context, index) {
                    // Movie movie = movieList[index];
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
                        margin: EdgeInsets.only(left: 10),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.network(
                                jsonList[index]['cover'],
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 5,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  SizedBox(height: 8),
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
                            )
                          ],
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
    );
  }
}
