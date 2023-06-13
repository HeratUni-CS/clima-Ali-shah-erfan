import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

      Future<void> getCurrentLocation() async{
         try {
            Position positon = await Geolocator().getCurrentLocation(desiredAccuracy: LocationAccuracy.low);
          
          latitude = positon.latitude;
          longitude = positon.longitude;

          } catch (e) {
              print(e);
          }
}
}