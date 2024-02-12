import 'package:flutter/material.dart';
import 'package:study_room_project/Config/di.dart';
import 'package:study_room_project/Screens/Login/Login.dart';
import 'package:study_room_project/Screens/NavigationPage.dart';
import 'package:study_room_project/Service/db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override
  void initState() {
    // config.get<SharedPreferences>().clear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (config.get<SharedPreferences>().getString('name') == null)
        ? LoginSplash()
        : HomeSplash();
  }
}

Widget SplashWidget() {
  return Scaffold(
      body: Container(
    width: double.maxFinite,
    height: double.maxFinite,
    decoration: ShapeDecoration(
      image: DecorationImage(image: AssetImage('assets/logo (1).png')),
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    ),
  ));
}

Widget DatawidgetLogin() {
  return FutureBuilder(
      future: DataService().getRooms(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Login();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashWidget();
        } else {
          return SizedBox(
              height: 400,
              width: double.maxFinite,
              child: Center(child: Text('try again')));
        }
      });
}

Widget DatawidgetHome() {
  return FutureBuilder(
      future: DataService().getRooms(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NavigationPage(
                  selectedIndex: 3,
                );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashWidget();
        } else {
          return SizedBox(
              height: 400,
              width: double.maxFinite,
              child: Scaffold(body: Center(child: Text('try again'))));
        }
      });
}

class HomeSplash extends StatefulWidget {
  const HomeSplash({super.key});

  @override
  State<HomeSplash> createState() => _HomeSplashState();
}

class _HomeSplashState extends State<HomeSplash> {
  @override
  void initState() {
    _navigator();
    super.initState();
  }

  _navigator() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DatawidgetHome()));
  }

  @override
  Widget build(BuildContext context) {
    return SplashWidget();
  }
}

class LoginSplash extends StatefulWidget {
  const LoginSplash({super.key});

  @override
  State<LoginSplash> createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {
  @override
  void initState() {
    _navigator();
    super.initState();
  }

  _navigator() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DatawidgetLogin()));
  }

  @override
  Widget build(BuildContext context) {
    return SplashWidget();
  }
}