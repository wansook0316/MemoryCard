//
//  AddView.swift
//  MemoryCard
//
//  Created by ws.choi on 12/22/24.
//

import SwiftUI
import SwiftData

public struct AddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Bindable var card: Card

    public init() {
        self._card = Bindable(Card(question: "", answer: ""))
    }

    public var body: some View {
        Form {
            TextField("Question", text: $card.question)
            TextField("Answer", text: $card.answer)

            Button("Save") {
                self.modelContext.insert(self.card)
                do {
                    try self.modelContext.save()
                    self.presentationMode.wrappedValue.dismiss()
                    print("Card saved successfully!")
                } catch {
                    print("Failed to save card: \(error)")
                }
            }
        }
        .navigationTitle("Add Card")
    }
}

struct AddView_Previews: PreviewProvider {

    static var previews: some View {
        AddView()
    }

}
