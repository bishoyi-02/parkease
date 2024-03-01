import 'package:flutter/material.dart';
import 'package:park_app/data_models/booking_details.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:park_app/widgets/payment_modal_widget.dart';
import 'package:flutter/services.dart';

Future<String> makePostRequest(
    String lotId, String startTime, String endTime, String dayOfWeek) async {
  final url = Uri.parse(
      'http://192.168.231.196:5000/predict'); // Replace with your API endpoint
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'lotId': lotId,
      'startTime': startTime,
      'endTime': endTime,
      'dayOfWeek': dayOfWeek
    }),
  );
  String data = json.decode(response.body);
  // print(data);
  if (response.statusCode == 200) {
    // Request was successful
    print('Response data: ${response.body}');
  } else {
    // Request failed
    print('Request failed with status: ${response.statusCode}');
  }
  print(response.body.runtimeType);
  return data;
}

class PaymentPage extends StatefulWidget {
  const PaymentPage(this.address, this.lot_id, this.changeScreen, {super.key});
  final changeScreen;
  final String address;
  final String lot_id;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TimeOfDay startTime = TimeOfDay.now(); // Store the selected time
  TimeOfDay endTime = TimeOfDay.now(); // Store the selected time

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          startTime ?? TimeOfDay.now(), // Use the selected time or current time
    ); // post

    if (picked != null && picked != startTime) {
      setState(() {
        print(startTime);
        startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          endTime ?? TimeOfDay.now(), // Use the selected time or current time
    ); // post

    if (picked != null && picked != endTime) {
      setState(() {
        // print(startTime);
        endTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String startHours = startTime.hour.toString();
    String startMinutes = startTime.minute.toString();

    String endHours = endTime.hour.toString();
    String endMinutes = endTime.minute.toString();

    if (startHours.length == 1) {
      startHours = '0$startHours';
    }
    if (startMinutes.length == 1) {
      startMinutes = '0$startMinutes';
    }

    if (endHours.length == 1) {
      endHours = '0$endHours';
    }
    if (endMinutes.length == 1) {
      endMinutes = '0$endMinutes';
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),
                Text(
                  widget.lot_id,
                  style: TextStyle(
                    fontSize: 34.4,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  widget.address,
                  style: TextStyle(
                    // fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Start Time',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                          color: Colors.grey[800],
                        ),
                      ),
                      Card(
                        elevation: 30,
                        shadowColor: Colors.blueGrey,
                        color: Colors.black,
                        child: GestureDetector(
                          onTap: () {
                            _selectStartTime(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              '$startHours:$startMinutes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        'End Time',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                          color: Colors.grey[800],
                        ),
                      ),
                      Card(
                        elevation: 30,
                        shadowColor: Colors.blueGrey,
                        color: Colors.black,
                        child: GestureDetector(
                          onTap: () {
                            _selectEndTime(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              '$endHours:$endMinutes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Fetching Amount Details'),
                      ));
                      String predictedAmount = await makePostRequest(
                          widget.lot_id,
                          '$startHours:$startMinutes',
                          '$endHours:$endMinutes',
                          '${DateTime.now().weekday - 1}');
                      HapticFeedback.mediumImpact();
                      SystemSound.play(SystemSoundType.click);
                      showModalBottomSheet<void>(
                        context: context,
                        // isScrollControlled: true,
                        builder: (BuildContext context) {
                          // print(predictedAmount);
                          return PaymentModalWidget(
                            lotId: widget.lot_id,
                            address: widget.address,
                            changeScreen: widget.changeScreen,
                            amount: predictedAmount,
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    child: Text(
                      'Set',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          wordSpacing: 4,
                          letterSpacing: 0.3),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
