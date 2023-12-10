import 'package:dio/dio.dart';
import 'package:film/pages/Login.dart';
import 'package:film/wigets/CustomNavBar.dart';
import 'package:film/wigets/UpcomingWidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  var userProfile;
  String uuid = '', email = '';

  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        uuid = user.uid;
        email = user.email ?? '';
      });
    }

    try {
      var response = await Dio().get(
          'https://cinemahub-roihanfs-default-rtdb.firebaseio.com/users.json');
      if (response.statusCode == 200) {
        Map<String, dynamic> userData = response.data;

        String? userProfileKey;
        for (var key in userData.keys) {
          if (userData[key]['uid'] == uuid) {
            userProfileKey = key;
            break;
          }
        }

        if (userProfileKey != null) {
          userProfile = userData[userProfileKey];
          setState(() {
            _firstNameController.text = userProfile['firstName'].toString();
            _lastNameController.text = userProfile['lastName'].toString();
          });
        } else {
          print('Profil pengguna dengan UID $uuid tidak ditemukan.');
        }
      }
      // print(jsonList);
    } catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _auth.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            userProfile != null
                ? Container(
                    width: double.infinity,
                    height: 690 ,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: const SizedBox(
                                    height: 125,
                                    width: 125,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/profile.jpg'),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),

                                //FIRST NAME
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    "First Name",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    hintText: _firstNameController.text,
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Poppins Light',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                //LAST NAME
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    "Last Name",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    hintText: _lastNameController.text,
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Poppins Light',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                //EMAIL
                                Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    "Email",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10,
                                    ),
                                    hintText: email,
                                    hintStyle: const TextStyle(
                                      fontFamily: 'Poppins Light',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          UpcomingWidget(),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
