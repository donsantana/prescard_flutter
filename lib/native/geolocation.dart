import 'package:flutter/services.dart';
import 'package:prescard/utils/geolocation_utils.dart';


class GeolocationPermissionStatus{
  static const granted = "GRANTED";
  static const denied = "DENIED";
  static const unknown = "UNKNOWN";
}

typedef void OnGpsEnable(bool isEnable);
typedef void OnLocationUpdate(Coord location);

class Geolocation{

  final _channel = MethodChannel("donelkyss.prescard/geolocation");
  OnGpsEnable onGpsEnable;
  OnLocationUpdate onLocationUpdate;

  Geolocation(){
    _channel.setMethodCallHandler((MethodCall call) async {
      switch(call.method){
        case "getLocation":
          if(onLocationUpdate != null){
            onLocationUpdate(Coord(call.arguments['lat'], call.arguments['lng']));
          }
          break;
        case "onGpsEnable":
          final bool isEnable = call.arguments;
          if(onGpsEnable != null){
            onGpsEnable(isEnable);
          }
          break;
        default:
          print("No location got it.");
      }
    });
  }

  Future<String> requestPermission() async{
    print("calling requestPermission");
    final result = await _channel.invokeMethod("permission");
    print("requestPermission status: $result");
    return result;
  }

  startTracking() async{
    print("calling starTracking");
    await _channel.invokeMethod("startTracking");
  }

  stopTracking() async{
    print("invoking stop tracking");
    await _channel.invokeMethod("stopTracking");
  }
}