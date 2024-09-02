//
//  NumberView.swift
//  MkodoUI
//
//  Created by eren k on 01/09/2024.
//

import SwiftUI

struct NumberView: View {
    let number: String
    var isBonus = false
    var isMatched = false
    
    var body: some View {
        Text(number)
            .padding(4)
            .background(isBonus ? .orange : .blue)
            .cornerRadius(4)
            .foregroundColor(isMatched ? .black : .white)
            .fontWeight(.bold)
            .accessibilityLabel(createAccessibilityText)
    }
    
    var createAccessibilityText: String {
        var text = isBonus ? "Bonus Ball: \(number)" : "Number: \(number)"
        text += isMatched ? "Matched" : ""
        return text
    }
}

#Preview {
    VStack {
        NumberView(number: "10", isBonus: false, isMatched: false)
        NumberView(number: "10", isBonus: true, isMatched: false)
        NumberView(number: "10", isBonus: false, isMatched: true)
        NumberView(number: "10", isBonus: true, isMatched: true)
    }
}
