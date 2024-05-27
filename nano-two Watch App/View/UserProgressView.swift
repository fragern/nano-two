//
//  UserProgressView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 21/05/24.
//

import SwiftUI

struct UserProgressView: View {
    @ObservedObject var progressManager: ProgressManager

    var body: some View {
        VStack {
            Text("\(Int(progressManager.progress * Double(progressManager.totalLocations))) out of \(progressManager.totalLocations)!")
                .padding()
            CircularProgressView(progress: progressManager.progress)
                .frame(width: 100, height: 100)
                .padding()
        }
    }
}

#Preview {
    UserProgressView(progressManager: ProgressManager(totalLocations: 8))
}

