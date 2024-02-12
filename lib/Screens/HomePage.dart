import 'package:flutter/material.dart';
import 'package:study_room_project/Config/colors.dart';
import 'package:study_room_project/Screens/rooms/Booking_Table.dart';

int selectedindex = 0;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGray,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: MostPopularListWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MostPopularListWidget extends StatefulWidget {
  const MostPopularListWidget({super.key});

  @override
  State<MostPopularListWidget> createState() => _MostPopularListWidgetState();
}

class _MostPopularListWidgetState extends State<MostPopularListWidget>
    with SingleTickerProviderStateMixin {
  late final PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        PageController(viewportFraction: 0.7, initialPage: _currentPage);
    _controller.addListener(_changePage);
  }

  void _changePage() {
    setState(() {
      _currentPage = _controller.page!.round();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_changePage);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Welcome to COSEL',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Dubai',
                          fontSize: 28,
                          color: Themecolor,
                        )),
              ),
            )
          ],
        ),
      ),
      //     const SizedBox(height: kDefaultPadding),
      Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedindex = 0;
                      });
                    },
                    child: Container(
                      height: 115,
                      width: 108,
                      child: Image.asset(
                        'assets/active1.png',
                        scale: 0.0001,
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedindex = 1;
                      });
                    },
                    child: Container(
                      height: 115,
                      width: 108,
                      child: Image.asset(
                        'assets/non-active1.png',
                        scale: 0.0001,
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedindex = 2;
                      });
                    },
                    child: Container(
                      height: 115,
                      width: 108,
                      child: Image.asset(
                        'assets/Group 7.png',
                        scale: 0.0001,
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      rooms[selectedindex],
      Padding(
        padding: const EdgeInsets.only(top: 70),
        child: InkWell(
          onTap: () async {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BookingTable(type: selectedindex,)));
          },
          child: Container(
            alignment: Alignment.bottomCenter,
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
                'Book Now',
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
    ]);
  }
}

List rooms = [MeetingRoomWidget(), cofeeShop(), StudyRoom()];

Widget MeetingRoomWidget() {
  return Column(
    children: [
      Image.asset('assets/1.png'),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Text(
              style: TextStyle(color: Color.fromARGB(171, 118, 116, 116)),
              'COSEL creates studying spaces that help students go further, faster by building a positive community dreaming of a better tomorrow.'),
        ),
      ),
    ],
  );
}

Widget cofeeShop() {
  return Column(
    children: [
      Image.asset('assets/Mask Group.png'),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Text(
              style: TextStyle(color: Color.fromARGB(171, 118, 116, 116)),
              'Celebrate the irrisistible flavor of coffee in our range of espresso , cocktails and ice drink'),
        ),
      ),
    ],
  );
}

Widget StudyRoom() {
  return Column(
    children: [
      Image.asset('assets/image.png'),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Text(
              style: TextStyle(color: Color.fromARGB(171, 118, 116, 116)),
              'COSEL creates studying spaces that help students go further, faster by building a positive community dreaming of a better tomorrow.'),
        ),
      ),
    ],
  );
}
