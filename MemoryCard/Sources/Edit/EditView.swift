//
//  EditView.swift
//  MemoryCard
//
//  Created by ws.choi on 12/22/24.
//

import SwiftUI
import SwiftData

public struct EditView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Bindable var card: Card

    public var body: some View {
        Form {
            TextField("Question", text: $card.question)
            TextField("Answer", text: $card.answer)

            Button("Save") {
                if self.modelContext.hasChanges {
                    try? self.modelContext.save()
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.modelContext.insert(self.card)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }

            Button("Delete") {
                self.modelContext.delete(self.card)
                do {
                    try self.modelContext.save()
                    self.presentationMode.wrappedValue.dismiss()
                    print("Card deleted successfully!")
                } catch {
                    print("Failed to delete card: \(error)")
                }
            }
            .foregroundColor(.red) // 삭제 버튼을 시각적으로 강조
        }
        .navigationTitle("Edit Card")
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(card: .init(question: "hi", answer: "안녕"))
    }
}
