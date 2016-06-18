//
//  LocationFunctions.swift
//  DreamRaju
//
//  Created by Ethan Hess on 6/17/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

import UIKit
import CoreLocation

class LocationFunctions: NSObject {

    static let sharedLocation = LocationFunctions()
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    
    var locationReturnedBlock: ((currentLocation: CLLocationCoordinate2D)->Void)!
    var sentALocation = true
    
    override init() {
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //perhaps just when in use?
        locationManager.requestAlwaysAuthorization()
        
    }
    
    func locationWithComplete(locationComplete:(currentLocation: CLLocationCoordinate2D)->Void) {
        
        self.sentALocation = false
        self.locationReturnedBlock = locationComplete
        self.locationManager.startUpdatingLocation()
        
    }
}

extension LocationFunctions: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let  mostRecentLocation = locations.last {
            if let currentLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(mostRecentLocation.coordinate.latitude, mostRecentLocation.coordinate.longitude) {
                self.currentLocation = currentLocation
                
                print("CURRENT LOCATION \(currentLocation)")
                
                if self.sentALocation == false {
                    print("calling location returned block")
                    self.locationReturnedBlock(currentLocation: currentLocation)
                    self.sentALocation = true
                }
                self.locationManager.stopUpdatingLocation()
                
            }
        }
    }
    
}
