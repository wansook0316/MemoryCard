//
//  ResultView.swift
//  MemoryCard
//
//  Created by ws.choi on 12/22/24.
//

import SwiftUI

public struct ResultView: View {
    @Environment(\.presentationMode) private var presentationMode
    @Binding private var moveToMain: Bool
    private let correctCount: Int
    private let totalCount: Int

    public init(moveToMain: Binding<Bool>, correctCount: Int, totalCount: Int) {
        self._moveToMain = moveToMain
        self.correctCount = correctCount
        self.totalCount = totalCount
    }

    public var body: some View {
        VStack {
            Text("Test Complete!")
                .font(.largeTitle)
                .padding()

            Text("Correct: \(correctCount) / \(totalCount)")
                .font(.title)
                .padding()

            Button("Back to Flashcards") {
                self.presentationMode.wrappedValue.dismiss()
                self.moveToMain = true
            }
            .padding()
        }
        .navigationTitle("Result")
    }
}


struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(
            moveToMain: .constant(
                true
            ),
            correctCount: 5,
            totalCount: 10
        )
    }
}
