import 'package:film/pages/FavoritePage.dart';
import 'package:film/pages/HomePage.dart';
import 'package:film/pages/CategoryPage.dart';
import 'package:film/pages/ProfilePage.dart';
import 'package:film/wigets/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:795543860677:android:c548f50d30333c7ab5c7ac',
      apiKey: 'AIzaSyBdDJAW8bNiOhfUijixRPWyBGluCtxG9IU',
      messagingSenderId: '795543860677',
      projectId: 'cinemahub-roihanfs',
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Color.fromARGB(255, 235, 235, 235),
        scaffoldBackgroundColor: Color(0xFF0F111D),
      ),
      routes: {
        "/": (context) => SplashScreen(),
        "home": (context) => HomePage(),
        "categoryPage": (context) => CategoryPage(),
        "favoritePage": (context) => FavoritePage(),
        "profilePage": (context) => ProfilePage(),
      },
    );
  }
}
