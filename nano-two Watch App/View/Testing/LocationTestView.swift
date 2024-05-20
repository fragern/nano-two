//
//  LocationTestView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 18/05/24.
//

import SwiftUI

struct LocationTestView: View {
    @StateObject var locationDataManager = LocationDataManager()
    
    let merialCoffeeLatitude = -6.230874301585184
    let merialCoffeeLongitude = 106.8562261460639
    let geloraBungKarnoLatitude = -6.218335
    let geloraBungKarnoLongitude = 106.802216
    let maxDistance: CLLocationDistance = 10.0
    
    var body: some View {
        VStack {
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:
                // Location services are available.
                if let userLocation = locationDataManager.locationManager.location {
                    let merialCoffeeLocation = CLLocation(latitude: merialCoffeeLatitude, longitude: merialCoffeeLongitude)
                    let geloraBungKarnoLocation = CLLocation(latitude: geloraBungKarnoLatitude, longitude: geloraBungKarnoLongitude)
                    
                    let distanceInMeters = userLocation.distance(from: merialCoffeeLocation)
                    let distanceInKilometers = distanceInMeters / 1000.0
                    
                    let distanceMerialWithGBK = geloraBungKarnoLocation.distance(from: merialCoffeeLocation) / 1000.0
//                    let distanceMerialWithGBK = geloraBungKarnoLocation.distance(from: merialCoffeeLocation)
                    
                    if distanceInKilometers <= 10.0 {
                        Text("You are at Merial Coffee and you are \(String(format: "%.2f", distanceMerialWithGBK)) km away from Gelora Bung Karno!")
                    } else {
                        Text("Your current location is:")
                        Text("Latitude: \(userLocation.coordinate.latitude.description)")
                        Text("Longitude: \(userLocation.coordinate.longitude.description)")
                    }
                } else {
                    Text("Error loading user location.")
                }
                
            case .restricted, .denied:
                // Location services currently unavailable.
                Text("Current location data was restricted or denied.")
                
            case .notDetermined:
                // Authorization not determined yet.
                Text("Finding your location...")
                ProgressView()
                
            default:
                ProgressView()
            }
        }
    }
}

#Preview {
    LocationTestView()
}
