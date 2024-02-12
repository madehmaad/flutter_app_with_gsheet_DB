import 'package:flutter/material.dart';
import 'package:study_room_project/Config/colors.dart';
import 'package:study_room_project/Screens/NavigationPage.dart';
import 'package:study_room_project/Screens/rooms/Booking_Table.dart';

class BookedTables extends StatelessWidget {
  const BookedTables({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'Booked Tables',
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
              'Your Tables',
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
                        child:(Bookedlist == [])?
                        Text('No Table Booked'):
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Themecolor,
                            foregroundColor: Colors.white,
                            child: Text((index + 1).toString()),
                          ),
                          title: Text(Bookedlist[index].type),
                          tileColor: Colors.white,
                          subtitle:
                              Text('Table number ${Bookedlist[index].id}'),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: (Bookedlist.contains(Bookedlist[index]))
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
                  itemCount: Bookedlist.length),
            ),
          )
        ],
      ),
    );
    
  }
}
