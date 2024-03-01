import 'package:flutter/material.dart';
import 'package:park_app/data_models/booking_details.dart';
import 'package:park_app/screens/profile_page.dart';
import 'package:park_app/screens/bookings_page.dart';
import 'package:park_app/screens/reservation_page.dart';

final List<Booking> bookings = [
  // Booking(
  //     bookingId: 'cacsabcjabscaca',
  //     startTime: DateTime.now(),
  //     endTime: DateTime.now(),
  //     amount: 150,
  //     location: "Los Angeles, California"),
  // Booking(
  //     bookingId: 'abcsabcjabsjcsa',
  //     startTime: DateTime.now(),
  //     endTime: DateTime.now(),
  //     amount: 130,
  //     location: "Los Santos, Angelo"),
  // Booking(
  //     bookingId: 'wyqgewgeuvwehva',
  //     startTime: DateTime.now(),
  //     endTime: DateTime.now(),
  //     amount: 110,
  //     location: "Paris, France")
];

class Navigation extends StatefulWidget {
  const Navigation(
    this.emailId, {
    super.key,
  });

  final String emailId;
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  String title = 'Parking';

  void changeScreen(int index) {
    setState(() {
      currentPageIndex = index;
    });
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Booking Successful'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (currentPageIndex == 0) {
      title = 'Reservation';
    } else if (currentPageIndex == 1) {
      title = 'Bookings';
    } else if (currentPageIndex == 2) {
      title = 'Profile';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.local_parking),
            icon: Icon(Icons.local_parking),
            label: 'Parking',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.book),
            icon: Icon(Icons.book),
            label: 'Bookings',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          //color: Colors.blue,
          alignment: Alignment.center,
          child: ReservationPage(changeScreen: changeScreen),
        ),
        Container(
          //color: Colors.green,
          alignment: Alignment.center,
          child: BookingsPage(bookings: bookings),
        ),
        Container(
          //color: Colors.red,
          alignment: Alignment.center,
          child: ProfilePage(widget.emailId),
        ),
      ][currentPageIndex],
    );
  }
}
//AIzaSyAXyJelOXEblxU8PoHrJGsMs9UiweEu5Q