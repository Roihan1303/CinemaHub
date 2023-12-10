import 'package:film/pages/MoviePage.dart';
import 'package:film/services/api_data.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  final String searchKeyword;

  SearchResult({required this.searchKeyword});

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  dynamic _searchResults = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      // await _fetchSearchResults();
      _searchResults = await Movie().searchResult(widget.searchKeyword);
      setState(() {});
    } catch (e) {
      print('error');
    }
  }

  dynamic _performSearch() {
    String trimmedQuery = widget.searchKeyword.toLowerCase().trim();

    return _searchResults
        .where((filmData) =>
            (filmData["judul"] as String).toLowerCase().contains(trimmedQuery))
        .toList()
        .cast<dynamic>();
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = _performSearch();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search Results for: ${widget.searchKeyword}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        searchResults != null
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Container(
                  height: 680, // Set the height of the GridView
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.6,
                      crossAxisCount: 2, // 3 gambar dalam satu baris
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MoviePage(movie: searchResults[index]),
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
                                  searchResults[index]['cover'],
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      searchResults[index]['judul'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      searchResults[index]['genre'],
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
                                          searchResults[index]['nilai'],
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
                  ),
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
