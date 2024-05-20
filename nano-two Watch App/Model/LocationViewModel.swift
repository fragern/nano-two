//
//  LocationViewModel.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 18/05/24.
//

import SwiftUI
import CoreLocation

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var userLocation: CLLocation?

    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    // CLLocationManagerDelegate methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let newLocation = locations.last {
            userLocation = newLocation
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatus = status
    }

    // Custom locations
    var theBreezeBSDLocation: CLLocation {
        return CLLocation(latitude: -6.301320963048898, longitude: 106.65336500841606)
    }

    var appleDeveloperAcademyLocation: CLLocation {
        return CLLocation(latitude: -6.302180781293941, longitude: 106.6525654907035)
    }
}
