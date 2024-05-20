//
//  ContentView.swift
//  nano-two Watch App
//
//  Created by Nafis-Macbook on 14/05/24.
//

//import SwiftUI
//
//struct GameView: View {
////    @Environment(\.presentationMode) var presentationMode
//    
//    @State private var selectedLetter: String = ""
//    var emptyString = " "
//    @State private var guessedWord: String = " " {
//        didSet {
//            let trimmedWord = guessedWord.trimmingCharacters(in: .whitespaces)
//            
//            if Gods.names.contains(trimmedWord) {
//                print("The guessed word is OSIRIS!")
//                showingCompleteModal = true
//                guessedWord = emptyString
//            } else if trimmedWord.count == 6 && !Gods.names.contains(trimmedWord) {
//                print("Incorrect guess!")
//                showingErrorModal = true
//                guessedWord = emptyString
//            }
//        }
//    }
//    @State private var buttonClicked: [UUID: Bool] = [:]
//    @State private var showingCompleteModal = false
//    @State private var showingErrorModal = true
//    @State private var buttonVisibility: [String: Bool] = ["S": true, "R": true, "I": true, "O": true]
//    
//    let letters1 = ["S", "R", "I"].map { (letter: $0, id: UUID()) }
//    let letters2 = ["I", "S", "O"].map { (letter: $0, id: UUID()) }
//    
//    func resetGame() {
//        buttonClicked = [:]
//        guessedWord = emptyString
//        showingErrorModal = false
////        self.presentationMode.wrappedValue.dismiss()
//    }
//    
////    var buttonColorGrey = "#D9D9D9"
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                // Setting the background image
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        Image("standing_one")
//                            .resizable()
//                            .scaledToFit()
//                            .edgesIgnoringSafeArea(.all)
//
//                    }
//                    .padding(EdgeInsets(top: 0, leading: -30, bottom: -10, trailing: -20))
//                }
//                .padding(EdgeInsets(top: 15, leading: -20, bottom: 0, trailing: 0))
//                
//                VStack {
//                    Spacer()
//                    Text(guessedWord)
//                        .font(.largeTitle)
//                        .kerning(5)
//    //                    .padding()
//                    
//                    Divider()
//                    
//                    Spacer()
//                    
//                    HStack {
//                        ForEach(letters1, id: \.id) { item in
//                            Button(action: {
//                                if buttonClicked[item.id] ?? false {
//                                    guessedWord.removeLast()
//                                    buttonClicked[item.id] = false
//                                } else {
//                                    self.selectedLetter = item.letter
//                                    self.guessedWord += item.letter
//                                    buttonClicked[item.id] = true
//                                }
//                            }) {
//                                Text(item.letter)
//                                    .font(.title2)
//                                    .foregroundStyle(.black)
//                                    .padding()
//                            }
//                            .clipShape(Rectangle())
//                            .background(buttonClicked[item.id] ?? false ? Color.gray : Color.yellow)
//                            .cornerRadius(10)
//                        }
//                    }
////                    HStack {
////                        ForEach(letters1, id: \.id) { item in
////                            if buttonClicked[item.id] ?? true {
////                                Button(action: {
////                                    self.selectedLetter = item.letter
////                                    self.guessedWord += item.letter
//////                                    buttonVisible[item.id] = false
////                                }) {
////                                    Text(item.letter)
////                                        .font(.title2)
////                                        .foregroundColor(.black)
////                                        .padding()
////                                }
////                                .clipShape(Rectangle())
////                                .background(Color.teal)
////                                .cornerRadius(10)
////                            }
////                        }
////                    }
//                    Spacer()
//                    
//                    HStack {
//                        ForEach(letters2, id: \.id) { item in
//                            Button(action: {
//                                if buttonClicked[item.id] ?? false {
//                                    guessedWord.removeLast()
//                                    buttonClicked[item.id] = false
//                                } else {
//                                    self.selectedLetter = item.letter
//                                    self.guessedWord += item.letter
//                                    buttonClicked[item.id] = true
//                                }
//                            }) {
//                                Text(item.letter)
//                                    .font(.title2)
//                                    .foregroundStyle(.black)
//                                    .padding()
//                            }
//                            .clipShape(Rectangle())
//                            .background(buttonClicked[item.id] ?? false ? Color.gray : Color.yellow)
//                            .cornerRadius(10)
//                        }
//                    }
////                    HStack {
////                        ForEach(letters2, id: \.id) { item in
////                            if buttonClicked[item.id] ?? true {
////                                Button(action: {
////                                    self.selectedLetter = item.letter
////                                    self.guessedWord += item.letter
//////                                    buttonVisible[item.id] = false
////                                }) {
////                                    Text(item.letter)
////                                        .font(.title2)
////                                        .foregroundColor(.black)
////                                        .padding()
////                                }
////                                .clipShape(Rectangle())
////                                .background(Color.teal)
////                                .cornerRadius(10)
////                            }
////                        }
////                    }
//                }
//                
//                if showingCompleteModal {
//                    Rectangle()
//                        .fill(Color.black.opacity(0.8))
//                        .edgesIgnoringSafeArea(.all)
//                        .onTapGesture {
//                            showingCompleteModal = false
//                        }
//                        .padding(-20)
//                    VStack {
//                        CircularProgressView(progress: 0.6)
//                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
//                        Text("Completed")
//                            .font(.title2)
//                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
//                            .background(Color.green)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                }
//                if showingErrorModal {
//                    Rectangle()
//                        .fill(Color.black.opacity(0.8))
//                        .edgesIgnoringSafeArea(.all)
//                        .onTapGesture {
//                            resetGame()
//                        }
//                        .padding(-20)
//                    VStack {
//                        Text("Incorrect Guess!")
//                            .font(.title3)
//                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
//                            .background(Color.red)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                        Button(action: {
//                            resetGame()
//                        }) {
//                            Text("Retry")
//                                .font(.title2)
//                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
//                                .background(Color.blue)
//                                .foregroundColor(.white)
//                                .cornerRadius(10)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        .padding(.top, 20)
//                    }
//                }
//            }
//            .padding()
//        }
//        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarBackButtonHidden(false)
////        .background(Color.purple)
//    }
//}
//
//#Preview {
//    GameView()
//}

import SwiftUI

struct GameView: View {
    let godName: String
    
    @State private var selectedLetter: String = ""
    var emptyString = " "
    @State private var guessedWord: String = " " {
        didSet {
            let trimmedWord = guessedWord.trimmingCharacters(in: .whitespaces)
            if trimmedWord == godName {
                print("The guessed word is \(godName)!")
                showingCompleteModal = true
                guessedWord = emptyString
            } else if trimmedWord.count == godName.count && trimmedWord != godName {
                print("Incorrect guess!")
                showingErrorModal = true
                guessedWord = emptyString
            }
        }
    }
    @State private var buttonClicked: [UUID: Bool] = [:]
    @State private var showingCompleteModal = false
    @State private var showingErrorModal = false
    @State private var buttonVisibility: [String: Bool] = ["S": true, "R": true, "I": true, "O": true]
    
    var letters: [String] {
        Array(godName).map { String($0) }
    }
    
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
                    
                    Divider()
                    
                    Spacer()
                    
                    ForEach(letters.chunked(into: 3), id: \.self) { row in
                        HStack {
                            ForEach(row.indices, id: \.self) { index in
                                let letter = row[index]
                                let id = UUID()
                                Button(action: {
                                    if buttonClicked[id] ?? false {
                                        guessedWord.removeLast()
                                        buttonClicked[id] = false
                                    } else {
                                        self.selectedLetter = letter
                                        self.guessedWord += letter
                                        buttonClicked[id] = true
                                    }
                                }) {
                                    Text(letter)
                                        .font(.title2)
                                        .foregroundStyle(.black)
                                        .padding()
                                }
                                .clipShape(Rectangle())
                                .background(buttonClicked[id] ?? false ? Color.gray : Color.yellow)
                                .cornerRadius(10)
                            }
                        }
                    }
                    
                    Spacer()
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
                        CircularProgressView(progress: 0.6)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
                        Text("Completed")
                            .font(.title2)
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                if showingErrorModal {
                    Rectangle()
                        .fill(Color.black.opacity(0.8))
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            resetGame()
                        }
                        .padding(-20)
                    VStack {
                        Text("Incorrect Guess!")
                            .font(.title3)
                            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        Button(action: {
                            resetGame()
                        }) {
                            Text("Retry")
                                .font(.title3)
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top, 20)
                    }
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }
    
    func resetGame() {
        buttonClicked = [:]
        guessedWord = emptyString
        showingErrorModal = false
    }
}

#Preview {
    GameView(godName: "HORUS")
}

// Helper to chunk the letters into groups
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
