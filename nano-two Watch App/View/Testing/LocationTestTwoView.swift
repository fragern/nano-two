//
//  LocationTestTwoView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 18/05/24.
//

import SwiftUI

struct LocationTestTwoView: View {
    @StateObject var locationViewModel = LocationViewModel()

    var body: some View {
        VStack {
            Text("Authorization Status: \(locationViewModel.authorizationStatus.rawValue)")
            if let userLocation = locationViewModel.userLocation {
                Text("Latitude: \(userLocation.coordinate.latitude)")
                Text("Longitude: \(userLocation.coordinate.longitude)")
            } else {
                Text("User location not available.")
            }

            // Display custom locations
            Text("The Breeze BSD Location:")
            Text("Latitude: \(locationViewModel.theBreezeBSDLocation.coordinate.latitude)")
            Text("Longitude: \(locationViewModel.theBreezeBSDLocation.coordinate.longitude)")

            Text("Apple Developer Academy Location:")
            Text("Latitude: \(locationViewModel.appleDeveloperAcademyLocation.coordinate.latitude)")
            Text("Longitude: \(locationViewModel.appleDeveloperAcademyLocation.coordinate.longitude)")
        }
    }
}

#Preview {
    LocationTestTwoView()
}
