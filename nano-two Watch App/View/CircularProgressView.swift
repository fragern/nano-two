//
//  ProgressView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 20/05/24.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.green.opacity(0.5),
                    lineWidth: 15
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.green,
                    style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                // 1
                .animation(.easeOut, value: progress)

        }
    }
}

#Preview {
    CircularProgressView(progress: 0.75)
}
