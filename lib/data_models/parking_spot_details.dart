import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingSpotDetails {
  ParkingSpotDetails(
      {required this.parkingLotName,
      required this.Address,
      required this.contactNumber,
      required this.noOfSpotsAvailable,
      required this.position,
      required this.price,
      required this.email});
  String parkingLotName;
  int noOfSpotsAvailable;
  String Address;
  String contactNumber;
  LatLng position;
  String email;
  int price;
}
