//
//  ProgressManager.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 21/05/24.
//

import Foundation

class ProgressManager: ObservableObject {
    @Published var progress: Double = 0.0
    private let totalPuzzles: Int
    
    init(totalPuzzles: Int) {
        self.totalPuzzles = totalPuzzles
    }
    
    func incrementProgress() {
        progress += 1.0 / Double(totalPuzzles)
    }
}
