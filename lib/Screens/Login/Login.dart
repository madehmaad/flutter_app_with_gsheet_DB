import 'package:flutter/material.dart';
import 'package:study_room_project/Config/colors.dart';
import 'package:study_room_project/Config/di.dart';
import 'package:study_room_project/Screens/NavigationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController username;
  late TextEditingController password;
  late bool valuser;
  late bool valpass;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();
    valuser = false;
    valpass = false;

    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 105),
              child: Text(
                'welcome',
                style: TextStyle(
                  color: Themecolor,
                  fontSize: 28,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'LOOKING FOR A COZY STUDY SPOT',
                style: TextStyle(
                  color: Color(0xFF8F959E),
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
                height: 100,
                width: 500,
                child: Image.asset('assets/logo (1).png')),
            Form(
              autovalidateMode: AutovalidateMode.always,
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 100, right: 40, left: 40),
                    child: SizedBox(
                      width: 400,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            valuser = false;
                            return "You must enter your name";
                          } else {
                            valuser = true;
                            return null;
                          }
                        },
                        controller: username,
                        cursorColor: Themecolor,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Themecolor),
                          ),
                          labelText: 'Name',
                          floatingLabelStyle: TextStyle(color: Themecolor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 40, left: 40),
                    child: SizedBox(
                      width: 400,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value == '') {
                            valpass = false;
                            return "You must enter your Password";
                          } else {
                            valpass = true;
                            return null;
                          }
                        },
                        obscureText: true,
                        controller: password,
                        cursorColor: Themecolor,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Themecolor),
                          ),
                          labelText: 'Password',
                          floatingLabelStyle: TextStyle(color: Themecolor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 40, left: 40),
              child: InkWell(
                onTap: () {
                  if (valpass && valuser) {
                    config
                        .get<SharedPreferences>()
                        .setString('name', username.text);
                     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                           builder: (context) => NavigationPage(
                                  selectedIndex: 3,
                                )));
                    print("Login");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      duration: Duration(seconds: 2),
                      content: Center(
                        child: Text(
                          'المعلومات المدخلة خاطئة',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      backgroundColor: Color.fromARGB(255, 206, 40, 25),
                    ));
                  }
                },
                child: Container(
                  width: 287,
                  height: 59,
                  decoration: ShapeDecoration(
                    color: Themecolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
