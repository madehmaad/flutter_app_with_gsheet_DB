import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_room_project/Config/colors.dart';
import 'package:study_room_project/Config/di.dart';
import 'package:study_room_project/Screens/HomePage.dart';
import 'package:study_room_project/Screens/Login/Splash.dart';
import 'package:study_room_project/Screens/rooms/Booked.dart';

// ignore: must_be_immutable
class NavigationPage extends StatefulWidget {
  NavigationPage({super.key, required this.selectedIndex});
  int selectedIndex;
  @override
  State<NavigationPage> createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[widget.selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: 3,
        onTap: (value) {
          setState(() {
            widget.selectedIndex = value;
          });
        },
        animationCurve: Curves.easeInOutSine,
        height: 70,
        backgroundColor: Themecolor,
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}

final items = const [
  Icon(
    Icons.more_horiz_sharp,
    color: Color.fromARGB(255, 17, 84, 124),
    size: 30,
  ),
  Icon(
    Icons.notifications_none,
    size: 30,
    color: Color.fromARGB(255, 17, 84, 124),
  ),
  Icon(
    Icons.person,
    size: 30,
    color: Color.fromARGB(255, 17, 84, 124),
  ),
  Icon(
    Icons.home_outlined,
    size: 30,
    color: Color.fromARGB(255, 17, 84, 124),
  )
];
List<Widget> pages = [
  Logout(),
  BookedTables(),
  Profile(),
  Home(),
];

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 80,
                ),
              ),
            ),
            Text(
              config.get<SharedPreferences>().getString('name')!,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: IconButton(
                iconSize: 70,
                color: const Color.fromARGB(255, 221, 28, 28),
                onPressed: () {
                  config.get<SharedPreferences>().clear();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => StarterPage()));
                },
                icon: Icon(
                  Icons.logout,
                  size: 80,
                ),
              ),
            ),
            Text(
              'LogOut',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
