//
//  HomeView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 16/05/24.
//

//import SwiftUI
//import CoreLocation
//
//struct HomeView: View {
//    @StateObject var locationDataManager = LocationDataManager()
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                HStack {
//                    Image("small_two")
//                        .resizable()
//                        .scaledToFit()
//                    Image("small_one")
//                        .resizable()
//                        .scaledToFit()
//                }
//                .padding(.vertical, -10)
//                
//                VStack {
//                    if let userLatitude = locationDataManager.latitude,
//                       let userLongitude = locationDataManager.longitude {
//                        // Create locations array dynamically
//                        let locations: [Location] = [
////                            Location(locationName: "Your Location", latitude: userLatitude, longitude: userLongitude),
//                            Location(locationName: "San Francisco Museum", latitude: 37.78584535799374, longitude: -122.40101861564061, god: "OSIRIS"),
//                            Location(locationName: "The Breeze", latitude: -6.301320963048898, longitude: 106.65336500841606, god: "KHONSU"),
//                            Location(locationName: "Green Office Park", latitude: -6.302180781293941, longitude: 106.6525654907035, god: "ATUM"),
//                            Location(locationName: "Cisauk Station", latitude: -6.324300513454862, longitude: 106.6415670385678, god: "HATHOR"),
//                            Location(locationName: "Serpong Station", latitude: -6.319947702902948, longitude: 106.66562366925318, god: "HORUS"),
//                            Location(locationName: "Pasmod Intermoda", latitude: -6.321348193895189, longitude: 106.64347624795666, god: "ANUBIS"),
//                            Location(locationName: "AEON Mall BSD", latitude: -6.304259081215475, longitude: 106.64410941713008, god: "BASTET"),
////                            Location(locationName: "Traveloka Campus", latitude: -6.301543861547326, longitude: 106.65059008274588)
//                        ]
//                        
//                        // Display the location cards
//                        ForEach(locations, id: \.locationName) { location in
//                            NavigationLink(destination: GameView()) {
//                                LocationCardView(location: location, userLatitude: userLatitude, userLongitude: userLongitude)
//                            }
//                            .buttonStyle(PlainButtonStyle())
//                        }
//                    } else {
//                        Text("Loading location...")
//                    }
//                }
//                .onAppear {
//                    locationDataManager.requestLocation()
//                }
//            }
//            .navigationTitle("Deities Hunt")
//            .navigationBarTitleDisplayMode(.automatic)
//        }
//    }
//}
//
//#Preview {
//    HomeView()
//}

import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject var locationDataManager = LocationDataManager()
    
    let locations: [Location] = [
        Location(locationName: "San Francisco Museum", latitude: 37.78584535799374, longitude: -122.40101861564061, god: "OSIRIS"),
        Location(locationName: "The Breeze", latitude: -6.301320963048898, longitude: 106.65336500841606, god: "KHONSU"),
        Location(locationName: "Green Office Park", latitude: -6.302180781293941, longitude: 106.6525654907035, god: "ATUM"),
        Location(locationName: "Cisauk Station", latitude: -6.324300513454862, longitude: 106.6415670385678, god: "HATHOR"),
        Location(locationName: "Serpong Station", latitude: -6.319947702902948, longitude: 106.66562366925318, god: "HORUS"),
        Location(locationName: "Pasmod Intermoda", latitude: -6.321348193895189, longitude: 106.64347624795666, god: "ANUBIS"),
        Location(locationName: "AEON Mall BSD", latitude: -6.304259081215475, longitude: 106.64410941713008, god: "BASTET"),
        Location(locationName: "Traveloka Campus", latitude: -6.301543861547326, longitude: 106.65059008274588, god: "RA")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Image("small_two")
                        .resizable()
                        .scaledToFit()
                    Image("small_one")
                        .resizable()
                        .scaledToFit()
                }
                .padding(.vertical, -10)
                
                VStack {
                    if let userLatitude = locationDataManager.latitude,
                       let userLongitude = locationDataManager.longitude {
                        ForEach(locations, id: \.locationName) { location in
                            if isWithinRange(userLatitude: userLatitude, userLongitude: userLongitude, location: location) {
                                NavigationLink(destination: GameView(godName: location.god)) {
                                    LocationCardView(location: location, userLatitude: userLatitude, userLongitude: userLongitude)
                                }
                                .buttonStyle(PlainButtonStyle())
                            } else {
                                LocationCardView(location: location, userLatitude: userLatitude, userLongitude: userLongitude)
                                    .overlay(
                                        Color.black.opacity(0.5)
                                    )
                                    .cornerRadius(10)
                            }
                        }
                    } else {
                        Text("Loading location...")
                    }
                }
                .onAppear {
                    locationDataManager.requestLocation()
                }
            }
            .navigationTitle("Deities Hunt")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    func isWithinRange(userLatitude: Double, userLongitude: Double, location: Location) -> Bool {
        let userLocation = CLLocation(latitude: userLatitude, longitude: userLongitude)
        let targetLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let distance = userLocation.distance(from: targetLocation)
        return distance <= 10000 // Adjust the range as needed (100 meters in this example)
    }
}

#Preview {
    HomeView()
}

