//
//  LocationCardView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 17/05/24.
//

import SwiftUI

struct LocationCardView: View {
    let location: Location
    let userLatitude: Double
    let userLongitude: Double
    
    var body: some View {
        HStack (spacing: 8){
            VStack (alignment: .leading, spacing: 4){
                Text(location.locationName) // refactor to struct
                    .font(.system(size: 16))
//                Text("1 km") // refactor to struct
//                    .font(.system(size: 14))
//                    .opacity(0.75)
                Text("\(String(format: "%.2f", distanceFromUser)) km")
                    .opacity(0.5)
//                Text(String(format: "%.4f", location.latitude))
//                Text(String(format: "%.4f", location.longitude))
            }
            .padding()
            
            Spacer()
            
            VStack {
                Image(systemName: "location.magnifyingglass")
            }
            .padding()
        }
        .background(Color.yellow.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .padding(EdgeInsets(top: 0, leading: 2, bottom: 10, trailing: 2))
    }
    
    var distanceFromUser: Double {
        let userLocation = CLLocation(latitude: userLatitude, longitude: userLongitude)
        let targetLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let distanceInMeters = userLocation.distance(from: targetLocation)
        let distanceInKilometers = distanceInMeters / 1000.0
        
        return distanceInKilometers
    }
}

//struct ContentView: View {
//    var body: some View {
//        let sampleLocation = Location(locationName: "Sample", latitude: 0, longitude: 0)
//        LocationCardView(location: sampleLocation)
//    }
//}
//
//#Preview {
//    let sampleLocation = Location(locationName: "Sample", latitude: 0, longitude: 0)
//    LocationCardView(location: sampleLocation)
//}

struct ContentView: View {
    var body: some View {
        NavigationView {
            LocationCardView(location: Location(locationName: "Location", latitude: 0, longitude: 0, god: ""), userLatitude: 0, userLongitude: 0)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

