//
//  Geolocation.swift
//  Runner
//
//  Created by Donelkys Santana on 3/1/21.
//

import Foundation
import CoreLocation
import Flutter


class Geolocation: NSObject {
  
  let locationManager = CLLocationManager()
  var result: FlutterResult?
  
  override init() {
    super.init()
    locationManager.delegate = self
  }
  
  func setResult(result: @escaping FlutterResult)->Bool{
    if(self.result != nil){
      self.result?(FlutterError(code: "PENDING_RESULT_ERROR", message: "error you have a pening task", details: ""))
      self.result = nil
      return false
    }
    self.result = result
    return true
  }
  
  func sendResult(response: String){
    self.result?(response)
    self.result = nil
  }
  
  func requestPermission(){
    locationManager.requestWhenInUseAuthorization()
  }
  
  func checkPermission(result: @escaping FlutterResult){
    let isTrue = setResult(result: result)
    if isTrue{
      let status = checkPermissionStatus(status: CLLocationManager.authorizationStatus())
      if status == "ASK"{
        requestPermission()
      }else{
        sendResult(response: status)
      }
    }
  }
  
  func checkPermissionStatus(status: CLAuthorizationStatus)->String{
    switch status {
    case .authorizedWhenInUse:
      return "GRANTED"
    case .denied:
      return "DENIED"
    case .restricted:
      return "RESTRICTED"
    case .notDetermined:
      return "ASK"
    default:
      return "UNKNOWN"
    }
  }
}

extension Geolocation: CLLocationManagerDelegate{
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    let status = checkPermissionStatus(status: status)
    sendResult(response: status)
  }
}
