import SwiftUI
import CoreLocation

struct HomeView: View {
    @StateObject var locationDataManager = LocationDataManager()
    @StateObject var progressManager = ProgressManager(totalLocations: 8)

    let locations: [Location] = [
        Location(locationName: "The Qolam", latitude: -6.301891834965193, longitude: 106.65214118571649, god: "OSIRIS"),
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
                VStack {
                    HStack {
                        NavigationLink(destination: StaticInstructionView()) {
                            Image("egypt-map")
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .background(Color.yellow.opacity(0.85))
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: UserProgressView(progressManager: progressManager)) {
                            Image("small_three")
                                .resizable()
                                .scaledToFit()
                                .padding()
                                .background(Color.yellow.opacity(0.85))
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .aspectRatio(contentMode: .fit)
                    }
                }
                VStack {
                    if let userLatitude = locationDataManager.latitude,
                       let userLongitude = locationDataManager.longitude {

                        // Calculate distances and sort locations
                        let sortedLocations = locations.sorted { location1, location2 in
                            let distance1 = distanceFromUser(userLatitude: userLatitude, userLongitude: userLongitude, location: location1)
                            let distance2 = distanceFromUser(userLatitude: userLatitude, userLongitude: userLongitude, location: location2)
                            return distance1 < distance2
                        }

                        ForEach(sortedLocations.indices, id: \.self) { index in
                            let location = sortedLocations[index]
                            NavigationLink(destination: InstructionView(location: location, userLatitude: userLatitude, userLongitude: userLongitude, progressManager: progressManager, locationIndex: index)) {
                                LocationCardView(location: location, userLatitude: userLatitude, userLongitude: userLongitude)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    } else {
                        Text("Loading location...")
                    }
                }
                .onAppear {
                    locationDataManager.requestLocation()
                }
                .navigationTitle("Deities Hunt")
                .navigationBarTitleDisplayMode(.automatic)
            }
        }
    }

    func distanceFromUser(userLatitude: Double, userLongitude: Double, location: Location) -> Double {
        let userLocation = CLLocation(latitude: userLatitude, longitude: userLongitude)
        let targetLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        return userLocation.distance(from: targetLocation)
    }
}

#Preview {
    HomeView()
}
