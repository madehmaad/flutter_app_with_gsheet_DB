import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_room_project/Config/colors.dart';
import 'package:study_room_project/Config/di.dart';
import 'package:study_room_project/Config/gsheet.dart';
import 'package:study_room_project/Screens/HomePage.dart';
import 'package:study_room_project/Screens/NavigationPage.dart';
import 'package:study_room_project/Service/db.dart';

List Bookedlist = [];

class BookingTable extends StatefulWidget {
  BookingTable({super.key, required this.type});
  int type;

  @override
  State<BookingTable> createState() => _BookingTableState();
}

class _BookingTableState extends State<BookingTable> {
  @override
  Widget build(BuildContext context) {
    List selectedRoom = [
      BookingRoom(context, meetingRoomList, 'Meeting Room'),
      BookingRoom(context, coffeShopsList, 'Coffee Shop Room'),
      BookingRoom(context, studyRoomsList, 'Study Room'),
    ];
    Booked(List list, int index) {
      setState(() {
        if (!Bookedlist.contains(list[index])) {
          Bookedlist.add(list[index]);
        } else {
          Bookedlist.remove(list[index]);
        }
      });
    }

    return selectedRoom[selectedindex];
  }

  Widget BookingRoom(BuildContext context, List list, String txt) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              BackButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavigationPage(
                                selectedIndex: 3,
                              )));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 90),
                child: Text(
                  txt,
                  style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      color: Themecolor),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 250),
            child: Text(
              'Choose your Table',
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.maxFinite - 70,
              height: 500,
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                        height: 75,
                        decoration: ShapeDecoration(
                          color: Color.fromARGB(224, 227, 225, 225),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Themecolor,
                            foregroundColor: Colors.white,
                            child: Text((index + 1).toString()),
                          ),
                          title: Text(list[index].type),
                          tileColor: Colors.white,
                          subtitle: Text('Table number ${list[index].id}'),
                          trailing: IconButton(
                            onPressed: () async {
                              final feedback = {
                                SheetsColumn.table_id:
                                    list[index].id.toString(),
                                SheetsColumn.room_type: list[index].type,
                                SheetsColumn.status: 'Busy',
                                SheetsColumn.customer_name:
                                    config.get<SharedPreferences>().get('name'),
                              };
                              await UserSheetsApi.insert(
                                  list[index].id, feedback);
                              setState(() {
                                if (!Bookedlist.contains(list[index])) {
                                  Bookedlist.add(list[index]);

                                  // } else {
                                  //   Bookedlist.remove(list[index]);
                                }
                              });
                            },
                            icon: (Bookedlist.contains(list[index]))
                                ? BookedIcon(Icons.check,
                                    Color.fromARGB(255, 17, 230, 21))
                                : BookedIcon(Icons.add, Themecolor),
                          ),
                        ),
                      ),
                  // title: Text((result[index].id).toString()),
                  // subtitle: Text(result[index].title),

                  separatorBuilder: (context, index) => Divider(
                        height: 10,
                        color: Colors.transparent,
                      ),
                  itemCount: list.length),
            ),
          )
        ],
      ),
    );
  }
}

Widget BookedIcon(IconData icon, Color color) {
  return Icon(
    icon,
    color: color,
  );
}
