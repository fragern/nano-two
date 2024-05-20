//
//  CircularTestView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 20/05/24.
//

import SwiftUI

struct CircularTestView: View {
    // 1
    @State var progress: Double = 0
    
    var body: some View {
        VStack {
            ZStack {
                CircularProgressView(progress: progress)
                Text("\(progress * 100, specifier: "%.0f")")
                    .font(.title3)
                    .bold()
            }
            .frame(width: 120, height: 120)
            .padding(EdgeInsets(top: -30, leading: 0, bottom: 15, trailing: 0))
            
            Spacer()
            
            HStack {
                Slider(value: $progress, in: 0...1)
                Button("Reset") {
                    resetProgress()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
    
    func resetProgress() {
        progress = 0
    }
}

#Preview {
    CircularTestView()
}
