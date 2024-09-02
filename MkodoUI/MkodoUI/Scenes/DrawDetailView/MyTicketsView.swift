//
//  MyTicketsView.swift
//  MkodoUI
//
//  Created by eren k on 31/08/2024.
//

import SwiftUI

struct MyTicketsView: View {
    let realLuckyNumbers: [String]
    let realLuckyBonusNumbers: [String]?
    let ticketNumbers: [String]
    let bonusNumbers: [String]?
    let isWinning: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Your Ticket")
                .font(.headline)
            
            HStack {
                ForEach(ticketNumbers, id: \.self) { number in
                    if realLuckyNumbers.contains(number) {
                        NumberView(number: number, isMatched: true)
                    } else {
                        NumberView(number: number)
                    }
                }
                
                if let bonusNumbers = bonusNumbers {
                    ForEach(bonusNumbers, id: \.self) { number in
                        if let realLuckyBonusNumbers = realLuckyBonusNumbers,  realLuckyBonusNumbers.contains(number) {
                            NumberView(number: number, isBonus: true, isMatched: true)
                        } else {
                            NumberView(number: number, isBonus: true)
                        }
                    }
                }
            }
            
            Text(isWinning ? "Congratulations! You have a winning ticket!" : "Sorry, no matches this time.")
                .font(.headline)
                .foregroundColor(isWinning ? .green : .red)
                .padding(.top, 16)
        }
    }
}

#Preview {
    MyTicketsView(
        realLuckyNumbers: ["1", "2"],
        realLuckyBonusNumbers: ["1", "2"],
        ticketNumbers: ["1", "2"],
        bonusNumbers: ["1", "2"],
        isWinning: false
    )
}

