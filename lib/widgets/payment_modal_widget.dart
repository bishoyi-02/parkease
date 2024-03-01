import 'dart:math';
import 'package:flutter/material.dart';
import 'package:park_app/data_models/booking_details.dart';
import 'package:park_app/screens/bottom_nagivation_bar.dart';
import 'package:park_app/dummy_data/parking_spot_dummy_data.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class PaymentModalWidget extends StatelessWidget {
  PaymentModalWidget(
      {super.key, this.address, this.changeScreen, this.amount, this.lotId});
  final address;
  final changeScreen;
  final amount;
  final lotId;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: [
        Icon(
          Icons.wallet,
          color: Colors.black,
          size: 100,
        ),
        Spacer(),
        Text(
          "Amount to be Debited",
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        Spacer(),
        Card(
          color: Color.fromARGB(255, 250, 249, 249),
          shadowColor: Colors.blue,
          elevation: 30,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              '₹ ' + amount,
              style: TextStyle(
                  fontSize: 70,
                  // fontWeight: FontWeight.w800,
                  letterSpacing: 0.2),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                for (final parkingSpot in spots) {
                  if (lotId == parkingSpot.parkingLotName) {
                    parkingSpot.noOfSpotsAvailable -= 1;
                  }
                }
                Booking newBooking = Booking(
                  amount: double.parse(amount),
                  bookingId: getRandomString(10),
                  startTime: DateTime.now(),
                  endTime: DateTime.now(),
                  location: address,
                );
                bookings.insert(0, newBooking);
                changeScreen(1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                'PAY',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    wordSpacing: 4,
                    letterSpacing: 0.3),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 60,
        )
      ]),
    );
  }
}
