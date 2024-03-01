import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoCard({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9; // 65% of screen width
    return Center(
      child: Card(
        elevation: 4.0,
        color: Color.fromARGB(124, 21, 19, 12),
        child: Container(
          width: cardWidth,
          // margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w200,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                const SizedBox(
                    height: 4.0), // Add a small gap between label and value
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
