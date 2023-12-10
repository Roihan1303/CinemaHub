import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0XFF292b37),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // Navigasi ke HomePage
              Navigator.pushNamed(context, "home");
            },
            child: Column(
              children: [
                Icon(
                  Icons.home,
                  size: 35,
                  color: Colors.white,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigasi ke CategoryPage
              Navigator.pushNamed(context, "categoryPage");
            },
            child: Column(
              children: [
                Icon(
                  Icons.local_movies,
                  size: 35,
                  color: Colors.white,
                ),
                Text(
                  'Category',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigasi ke CategoryPage
              Navigator.pushNamed(context, "favoritePage");
            },
            child: Column(
              children: [
                Icon(
                  Icons.favorite,
                  size: 35,
                  color: Colors.white,
                ),
                Text(
                  'Favorite',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigasi ke ProfilePage
              Navigator.pushNamed(context, "profilePage");
            },
            child: Column(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 35,
                  color: Colors.white,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
