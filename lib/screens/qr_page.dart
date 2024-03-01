import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatelessWidget {
  const QrPage({super.key, required this.uniqueId});
  final String uniqueId;
  @override
  Widget build(BuildContext context) {
    String data = uniqueId;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImageView(
              data: data,
              backgroundColor: Colors.white,
              size: w * 0.5,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Text(
                "Booking ID",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Container(
                width: w * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    data,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
