import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  let geolocation = Geolocation()
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window.rootViewController as! FlutterBinaryMessenger
       let channel = FlutterMethodChannel(name: "donelkyss.prescard/geolocation", binaryMessenger: controller)
       
       channel.setMethodCallHandler({
         (call: FlutterMethodCall, result: @escaping FlutterResult)->Void in
         switch call.method{
         case "permission":
           self.geolocation.checkPermission(result: result)
         default:
           result(FlutterMethodNotImplemented)
         }
       })
       
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
