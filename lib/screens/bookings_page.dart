import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:park_app/data_models/booking_details.dart';
import 'package:park_app/screens/qr_page.dart';
// import 'package:park_app/widgets/bookings_card_widget.dart';
//import 'package:park_app/bottom_nagivation_bar.dart';

class BookingsPage extends StatelessWidget {
  BookingsPage({
    super.key,
    required this.bookings,
  });
  final bookings;

  var format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    if (bookings.isEmpty) {
      return Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nothing to display',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          SizedBox(height: 16),
          Text(
            'Try booking a Slot',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ));
    }
    return Scaffold(
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          Booking booking = bookings[index];
          return Card(
            child: ListTile(
              title: Text(
                booking.location.split(", ")[0],
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        format.format(booking.startTime),
                        style: TextStyle(color: Colors.amber, fontSize: 20),
                      ),
                    ],
                  ),
                  Text(
                    "₹ " + booking.amount.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            QrPage(uniqueId: booking.bookingId)));
              },
            ),
          );
        },
      ),
    );
  }
}
