//
//  StaticInstructionView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 21/05/24.
//

import SwiftUI

struct StaticInstructionView: View {
    var body: some View {
        VStack {
            Text("📝")
                .font(.title2)
                .padding()
            
            VStack {
                Text("1. Be in the range")
                Text("2. Solve the puzzle")
            }
            .padding()
            
        }
    }
}

#Preview {
    StaticInstructionView()
}
