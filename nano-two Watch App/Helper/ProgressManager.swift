//
//  ProgressManager.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 21/05/24.
//

import Foundation
import Combine

class ProgressManager: ObservableObject {
    @Published var progress: Double
    let totalLocations: Int

    init(totalLocations: Int) {
        self.totalLocations = totalLocations
        self.progress = 0.0
    }

    func updateProgress(currentLocationIndex: Int) {
        progress = Double(currentLocationIndex) / Double(totalLocations)
    }
}

