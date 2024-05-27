import SwiftUI

struct GameView: View {
    let godName: String
    @ObservedObject var progressManager: ProgressManager
    let locationIndex: Int

    @State private var shuffledLetters: [String] = []
    @State private var selectedLetter: String = ""
    var emptyString = " "
    @State private var guessedWord: String = " " {
        didSet {
            let trimmedWord = guessedWord.trimmingCharacters(in: .whitespaces)
            if trimmedWord == godName {
                print("The guessed word is \(godName)!")
                progressManager.updateProgress(currentLocationIndex: locationIndex + 1)
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

                    createGrid()

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
                        CircularProgressView(progress: progressManager.progress)
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
            .onAppear {
                shuffledLetters = Array(godName).map { String($0) }.shuffled()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
    }

    func resetGame() {
        buttonClicked = [:]
        guessedWord = emptyString
        showingErrorModal = false
    }

    @ViewBuilder
    func createGrid() -> some View {
        VStack {
            ForEach(shuffledLetters.chunked(into: rowSize()), id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { letter in
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
                                .foregroundColor(.black)
                                .padding()
                        }
                        .clipShape(Rectangle())
                        .background(buttonClicked[id] ?? false ? Color.gray : Color.yellow)
                        .cornerRadius(10)
                    }
                }
            }
        }
    }

    func rowSize() -> Int {
        switch godName.count {
        case 4: return 2
        case 5: return 3
        default: return 3
        }
    }
}

#Preview {
    GameView(godName: "OSIRIS", progressManager: ProgressManager(totalLocations: 8), locationIndex: 0)
}


extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
