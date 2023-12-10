import 'package:film/wigets/SearchResults.dart';
import 'package:film/wigets/UpcomingWidget.dart';
import 'package:film/wigets/NewMoviesWidget.dart';
import 'package:film/wigets/CustomNavBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Roihan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "What to Watch?",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      )
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "profilePage");
                      },
                      child: Image.asset(
                        "assets/images/profile.jpg",
                        height: 60,
                        width: 60,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFF292B37),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white54,
                    size: 30,
                  ),
                  Container(
                    width: 300,
                    margin: EdgeInsets.only(left: 5),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            if (_searchQuery
                .isNotEmpty)
              SearchResult(searchKeyword: _searchQuery)
            else
              Column(
                children: [
                  SizedBox(height: 30),
                  UpcomingWidget(),
                  SizedBox(height: 40),
                  NewMoviesWidget(),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              ),
          ],
        )),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}