//
//  ContentView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 14/05/24.
//

import SwiftUI

struct ContentView: View {
//    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedLetter: String = ""
    @State private var guessedWord: String = " " {
        didSet {
            if Gods.names.contains(guessedWord.trimmingCharacters(in: .whitespaces)) {
                print("The guessed word is OSIRIS!")
                showingCompleteModal = true
                guessedWord = " "
            }
        }
    }
    @State private var buttonClicked: [UUID: Bool] = [:]
    @State private var showingCompleteModal = false
    @State private var buttonVisibility: [String: Bool] = ["S": true, "R": true, "I": true, "O": true]
    
    let letters1 = ["S", "R", "I"].map { (letter: $0, id: UUID()) }
    let letters2 = ["I", "S", "O"].map { (letter: $0, id: UUID()) }
    
    func resetGame() {
        buttonClicked = [:]
//        self.presentationMode.wrappedValue.dismiss()
    }
    
//    var buttonColorGrey = "#D9D9D9"
    
    var body: some View {
        NavigationView {
            ZStack {
                // Setting the background image
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image("standing_one")
                            .resizable()
                            .scaledToFit()
                            .edgesIgnoringSafeArea(.all)

                    }
                    .padding(EdgeInsets(top: 0, leading: -30, bottom: -10, trailing: -20))
                }
                .padding(EdgeInsets(top: 15, leading: -20, bottom: 0, trailing: 0))
                
                VStack {
                    Spacer()
                    Text(guessedWord)
                        .font(.largeTitle)
                        .kerning(5)
    //                    .padding()
                    
                    Divider()
                    
                    Spacer()
                    
                    HStack {
                        ForEach(letters1, id: \.id) { item in
                            Button(action: {
                                if buttonClicked[item.id] ?? false {
                                    guessedWord.removeLast()
                                    buttonClicked[item.id] = false
                                } else {
                                    self.selectedLetter = item.letter
                                    self.guessedWord += item.letter
                                    buttonClicked[item.id] = true
                                }
                            }) {
                                Text(item.letter)
                                    .font(.title2)
                                    .foregroundStyle(.black)
                                    .padding()
                            }
                            .clipShape(Rectangle())
                            .background(buttonClicked[item.id] ?? false ? Color.gray : Color.teal)
                            .cornerRadius(10)
                        }
                    }
//                    HStack {
//                        ForEach(letters1, id: \.id) { item in
//                            if buttonClicked[item.id] ?? true {
//                                Button(action: {
//                                    self.selectedLetter = item.letter
//                                    self.guessedWord += item.letter
////                                    buttonVisible[item.id] = false
//                                }) {
//                                    Text(item.letter)
//                                        .font(.title2)
//                                        .foregroundColor(.black)
//                                        .padding()
//                                }
//                                .clipShape(Rectangle())
//                                .background(Color.teal)
//                                .cornerRadius(10)
//                            }
//                        }
//                    }
                    Spacer()
                    
                    HStack {
                        ForEach(letters2, id: \.id) { item in
                            Button(action: {
                                if buttonClicked[item.id] ?? false {
                                    guessedWord.removeLast()
                                    buttonClicked[item.id] = false
                                } else {
                                    self.selectedLetter = item.letter
                                    self.guessedWord += item.letter
                                    buttonClicked[item.id] = true
                                }
                            }) {
                                Text(item.letter)
                                    .font(.title2)
                                    .foregroundStyle(.black)
                                    .padding()
                            }
                            .clipShape(Rectangle())
                            .background(buttonClicked[item.id] ?? false ? Color.gray : Color.teal)
                            .cornerRadius(10)
                        }
                    }
//                    HStack {
//                        ForEach(letters2, id: \.id) { item in
//                            if buttonClicked[item.id] ?? true {
//                                Button(action: {
//                                    self.selectedLetter = item.letter
//                                    self.guessedWord += item.letter
////                                    buttonVisible[item.id] = false
//                                }) {
//                                    Text(item.letter)
//                                        .font(.title2)
//                                        .foregroundColor(.black)
//                                        .padding()
//                                }
//                                .clipShape(Rectangle())
//                                .background(Color.teal)
//                                .cornerRadius(10)
//                            }
//                        }
//                    }
                }
                
                if showingCompleteModal {
                    Rectangle()
                        .fill(Color.black.opacity(0.8))
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showingCompleteModal = false
                        }
                        .padding(-20)
                    VStack {
                        Text("Completed")
                            .font(.title2)
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
//        .background(Color.purple)
    }
}

#Preview {
    ContentView()
}
