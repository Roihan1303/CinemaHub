import 'package:film/pages/CategoryListPage.dart';
import 'package:film/wigets/CustomNavBar.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final List<String> category = [
    "Action",
    "Chrime",
    "Drama",
    "Horror",
    "Laga",
    "Thriller",
  ];
  final List<String> cover = [
    "https://cdn.idntimes.com/content-images/duniaku/post/20210922/venom-2-poster-tom-hardy-7c2075740285744cc52c7646d1230ffb.jpg",
    "https://img.hurawatch.bz/i/cache/images/7/7d/7d278e0f07ea31831d95aad3ae394f8e.jpg",
    "https://o-cdn-cas.sirclocdn.com/parenting/images/Sinopsis-peaky-blinders.width-800.format-webp.webp",
    "https://img.hurawatch.bz/i/cache/images/8/80/805b09e2acc329f922a04049c9100f4b.jpg",
    "https://m.media-amazon.com/images/M/MV5BY2ZlNWIxODMtN2YwZi00ZjNmLWIyN2UtZTFkYmZkNDQyNTAyXkEyXkFqcGdeQXVyODkzNTgxMDg@._V1_.jpg",
    "https://img.hurawatch.bz/i/cache/images/a/a7/a72d174bfd5844b721fe7d3a7f976001.jpg",
  ];

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
                "Category",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: List.generate(category.length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CategoryListPage(category: category[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        children: [
                          // Icon(
                          //   Icons.widgets,
                          //   size: 60,
                          //   color: Colors.white,
                          // ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              cover[index],
                              height: 100,
                              width: 90,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Category ${category[index]}",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
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
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
