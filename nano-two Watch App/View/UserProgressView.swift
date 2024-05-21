//
//  UserProgressView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 21/05/24.
//

import SwiftUI

struct UserProgressView: View {
    var body: some View {
        Text("Your Progress is {..} out of 8!")
            .multilineTextAlignment(.center)
            .padding()
    }
}

#Preview {
    UserProgressView()
}
