import 'package:film/pages/MoviePage.dart';
import 'package:film/services/api_data.dart';
import 'package:film/wigets/CustomNavBar.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePage();
}

class _FavoritePage extends State<FavoritePage> {
  var jsonList;
  String uuid = '';

  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      jsonList = await Movie().getFavorites();
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
              child: Text(
                "Favorite",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            jsonList != null
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Container(
                      height: 670, // Set the height of the GridView
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.6,
                          crossAxisCount: 2, // 3 gambar dalam satu baris
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        itemCount: jsonList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MoviePage(movie: jsonList[index][0]),
                                ),
                              );
                            },
                            child: Container(
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
                                      jsonList[index][0]['cover'],
                                      height: 200,
                                      width: double
                                          .infinity, // Lebar gambar mengisi seluruh kontainer
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 5,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          jsonList[index][0]['judul'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          jsonList[index][0]['genre'],
                                          style: TextStyle(
                                            color: Colors.white54,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                Text(
                                                  jsonList[index][0]['nilai'],
                                                  style: TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 16,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                              size: 25,
                                            ),
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
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
