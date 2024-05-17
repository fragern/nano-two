//
//  HomeView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 16/05/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink(destination: ContentView()) {
                    LocationCardView()
                }
                .buttonStyle(PlainButtonStyle())
                NavigationLink(destination: ContentView()) {
                    LocationCardView()
                }
                .buttonStyle(PlainButtonStyle())
                NavigationLink(destination: ContentView()) {
                    LocationCardView()
                }
                .buttonStyle(PlainButtonStyle())
                NavigationLink(destination: ContentView()) {
                    LocationCardView()
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationTitle("Deities Hunt")
            .navigationBarTitleDisplayMode(.automatic)
//            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
