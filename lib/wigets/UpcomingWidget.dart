import 'package:film/pages/MoviePage.dart';
import 'package:film/services/api_data.dart';
import 'package:film/wigets/SeeAllWidget.dart';
import 'package:flutter/material.dart';

class UpcomingWidget extends StatefulWidget {
  const UpcomingWidget({super.key});

  @override
  State<UpcomingWidget> createState() => _UpcomingWidget();
}

class _UpcomingWidget extends State<UpcomingWidget> {
  var jsonList;
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      jsonList = await Movie().getUpComingMovie();
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
                "Upcoming Movies",
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
                      builder: (context) => SeeAllWidget(newMovie: false),
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
        jsonList != null
            ? SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < jsonList.length; i++)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MoviePage(movie: jsonList[i]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              jsonList[i]['sampul'],
                              height: 180,
                              width: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              )
            : Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
      ],
    );
  }
}
