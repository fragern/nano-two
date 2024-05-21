//
//  InstructionView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 21/05/24.
//

import SwiftUI

struct InstructionView: View {
    let location: Location
    let userLatitude: Double
    let userLongitude: Double
    @EnvironmentObject var progressManager: ProgressManager
    
    var body: some View {
        VStack {
            Text("📝")
                .font(.title2)
            
            Spacer()
            
            Text("1. Be in the range")
            Text("2. Solve the puzzle")
            
            Spacer()
            
            if isWithinRange(userLatitude: userLatitude, userLongitude: userLongitude, location: location) {
                NavigationLink(destination: GameView(godName: location.god).environmentObject(progressManager)) {
                    Text("Start Puzzle")
                        .font(.title3)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
            } else {
                Text("Not in the range")
                    .foregroundColor(.red)
            }
            
            Spacer()
        }
        .navigationTitle("Instructions")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func isWithinRange(userLatitude: Double, userLongitude: Double, location: Location) -> Bool {
        let userLocation = CLLocation(latitude: userLatitude, longitude: userLongitude)
        let targetLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let distance = userLocation.distance(from: targetLocation)
        return distance <= 100 // Adjust the range as needed (100 meters in this example)
    }
}

#Preview {
    InstructionView(location: Location(locationName: "San Francisco Museum", latitude: 37.78584535799374, longitude: -122.40101861564061, god: "OSIRIS"), userLatitude: 37.78584535799374, userLongitude: -122.40101861564061)
        .environmentObject(ProgressManager(totalPuzzles: 8))
}
