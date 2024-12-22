//
//  ListView.swift
//  MemoryCard
//
//  Created by ws.choi on 12/22/24.
//

import SwiftUI
import SwiftData

public struct ListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var cards: [Card]

    public var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: AddView()) {
                    Text("Add New Card")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                }
                NavigationLink(destination: TestView()) {
                    Text("Start Test")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                }
                List(cards) { card in
                    NavigationLink(value: card) {
                        VStack(alignment: .leading) {
                            Text(card.question)
                                .font(.headline)
                            Text(card.answer)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .navigationDestination(for: Card.self) { card in
                    EditView(card: card)
                }
            }
            .navigationTitle("Flashcards")
        }
        .modelContainer(for: [Card.self])
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
