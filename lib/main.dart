import 'package:flutter/material.dart';
import 'package:study_room_project/Config/di.dart';
import 'package:study_room_project/Config/gsheet.dart';
import 'package:study_room_project/Screens/Login/Splash.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetsApi.init();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StarterPage(),
    );
  }
}
