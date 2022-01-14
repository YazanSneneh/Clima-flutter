import 'package:geolocator/geolocator.dart';


class Location{
  double _longitude;
  double _latitude;

 Future<void> getCurrentLocation() async{
   Position position;
     try{
        position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
        _longitude = position.longitude;
        _latitude =  position.altitude;

     }catch(error){
       print(error);
     }

 }

  double get latitude => _latitude;

  double get longitude => _longitude;
}