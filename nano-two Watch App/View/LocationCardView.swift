//
//  LocationCardView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 17/05/24.
//

import SwiftUI

struct LocationCardView: View {
    var body: some View {
        HStack (spacing: 8){
            VStack (alignment: .leading, spacing: 4){
                Text("Green Office Park") // refactor to struct
                    .font(.system(size: 16))
                Text("1 km") // refactor to struct
                    .font(.system(size: 14))
                    .opacity(0.75)
            }
            .padding()
            
            Spacer()
            
            VStack {
                Image(systemName: "location.magnifyingglass")
            }
            .padding()
        }
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .padding(EdgeInsets(top: 0, leading: 2, bottom: 10, trailing: 2))
    }
}

#Preview {
    LocationCardView()
}
