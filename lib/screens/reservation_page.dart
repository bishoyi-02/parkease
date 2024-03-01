import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:park_app/data_models/parking_spot_details.dart';
import 'package:park_app/widgets/modal_card_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:park_app/dummy_data/parking_spot_dummy_data.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key, required this.changeScreen});
  final changeScreen;
  @override
  State<ReservationPage> createState() {
    return _ReservationPage();
  }
}

class _ReservationPage extends State<ReservationPage> {
  void _showParkingSpotDetails(String title, String availability,
      String address, String contactNumber, String price, String email) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ModalDesign(title, availability, address, contactNumber, price,
            email, widget.changeScreen);
      },
    );
  }

  LatLng currentPosition = LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    // print('Got Location');
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var position = await GeolocatorPlatform.instance.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
    // print("got location");
    currentPosition = LatLng(position.latitude, position.longitude);
    mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: currentPosition, zoom: 10)));
  }

  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    print(currentPosition);
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: currentPosition,
        zoom: 10000,
      ),
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
        });
      },
      // myLocationButtonEnabled: true,
      myLocationEnabled: true,
      markers: {
        for (final spot in spots)
          Marker(
            markerId: MarkerId(spots.indexOf(spot).toString()),
            position: spot.position, // Replace with actual coordinates
            infoWindow: InfoWindow(
              title: spot.parkingLotName,
              snippet: 'Available',
            ),
            onTap: () => _showParkingSpotDetails(
                spot.parkingLotName,
                spot.noOfSpotsAvailable.toString(),
                spot.Address,
                spot.contactNumber,
                spot.price.toString(),
                spot.email),
          ),
      },
    );
  }
}
