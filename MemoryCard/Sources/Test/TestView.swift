//
//  TestView.swift
//  MemoryCard
//
//  Created by ws.choi on 12/22/24.
//

import SwiftUI
import SwiftData

struct TestView: View {
    @Query private var cards: [Card]
    @State private var shuffledCards: [Card]
    @State private var currentCardIndex = 0
    @State private var showAnswer = false
    @State private var successfulCount = 0
    @State private var isFinished = false
    @State private var moveToMain = false

    init() {
        _shuffledCards = State(initialValue: [])
    }

    public var body: some View {
        NavigationView {
            VStack {
                if isFinished {
                    NavigationLink(destination: ResultView(moveToMain: self.$moveToMain, correctCount: successfulCount, totalCount: shuffledCards.count)) {
                        Text("View Results")
                    }
                } else {
                    if currentCardIndex < shuffledCards.count {
                        let card = shuffledCards[currentCardIndex]

                        VStack {
                            Text("Q: \(card.question)")
                                .font(.largeTitle)
                                .padding()

                            if showAnswer {
                                Text("A: \(card.answer)")
                                    .font(.title)
                                    .padding()
                            }

                            HStack {
                                Button("Failed") {
                                    self.handleSwipe(success: false)
                                }
                                .padding()

                                Button("Success") {
                                    self.handleSwipe(success: true)
                                }
                                .padding()

                                Button(action: {
                                    self.showAnswer.toggle()
                                }) {
                                    Text(showAnswer ? "Hide Answer" : "Show Answer")
                                }
                                .padding()
                            }
                        }
                        .padding()
                    } else {
                        Button("View Results") {
                            isFinished = true
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Test Cards")
            .onAppear {
                shuffledCards = cards.shuffled()
            }
        }
    }

    private func handleSwipe(success: Bool) {
        if success {
            successfulCount += 1
        }

        currentCardIndex += 1

        if currentCardIndex >= shuffledCards.count {
            isFinished = true
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
