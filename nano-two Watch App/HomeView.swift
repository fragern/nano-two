//
//  HomeView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 16/05/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            RowView(title: "Row 1")
            RowView(title: "Row 2")
        }
        .listStyle(.carousel)
    }
}

struct RowView: View {
    let title: String
    var body: some View {
        
        NavigationLink(destination: ContentView()) {
            
            Text(title)
                .frame(height: 80, alignment: .topTrailing)
                .listRowBackground(
                    Color.blue
                        .cornerRadius(12)
                )
        }
    }
}

#Preview {
    HomeView()
}
