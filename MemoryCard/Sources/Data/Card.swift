//
//  Card.swift
//  MemoryCard
//
// Created by ws.choi on 12/22/24.
//

import Foundation
import SwiftData

@Model
public class Card: Identifiable {
    @Attribute(.unique) public var id: String = UUID().uuidString
    public var question: String
    public var answer: String

    public init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
}
