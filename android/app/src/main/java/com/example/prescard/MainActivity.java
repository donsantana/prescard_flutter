package com.example.prescard;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
//    Geolocation geolocation;
//    MethodChannel channel;
//
//    @Override
//    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
//
//        //geolocation = new Geolocation(this);
//        //geolocation.onGeolocationListener = this;
//
//
//        //channel = new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(),"donelkyss.prescard/geolocation");
//
//        //channel.setMethodCallHandler(((call, result) -> {
//
////            switch (call.method){
////                case "permission":
////                    geolocation.checkPermission(result);
////                    break;
////                case "startTracking":
////                    geolocation.start();
////                    result.success(null);
////                    break;
////                case "stopTracking":
////                    geolocation.stopTracking();
////                    result.success(null);
////                    break;
////                default:
////                    result.notImplemented();
////            }
////        }));
//    }
//
//    @Override
//    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
//        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
//
////        if(requestCode == Geolocation.REQUEST_ACCESS_FINE_LOCATION){
////            if (grantResults.length > 0
////                    && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
////                // permission was granted, yay! Do the
////                // contacts-related task you need to do.
////                geolocation.sendResult("GRANTED");
////            } else {
////                // permission denied, boo! Disable the
////                // functionality that depends on this permission.
////                geolocation.sendResult("DENIED");
////            }
////        }
//    }
//
//    @Override
//    public void onGpsChanged(boolean isEnabled) {
//        channel.invokeMethod("onGpsEnable", isEnabled);
//    }
//
//    @Override
//    public void onLocationUpdated(HashMap<String, Double> position) {
//        channel.invokeMethod("getLocation",position);
//    }
//
//    @Override
//    protected void onDestroy() {
//        geolocation.unregister();
//        geolocation.stopTracking();
//        super.onDestroy();
//    }
}
