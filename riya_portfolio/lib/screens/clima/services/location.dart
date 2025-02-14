import 'package:geolocator/geolocator.dart';
class Location {
   double ? latitude;
   double ? longitude;

   Future<void> getCurrentLocation()async{
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    // Check for permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print(
          'Location permissions are permanently denied. Cannot request permissions.');
      return;
    }
     try {
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
        distanceFilter: 100,
      );
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      // print('Position: $position');
      latitude = position.latitude;
      longitude = position.longitude;

    } catch (e) {
      print('Error while fetching location: $e');
    }
   }
}