//
//  DrawDetailView.swift
//  MkodoUI
//
//  Created by eren k on 31/08/2024.
//

import SwiftUI

struct DrawDetailView: View {
    @ObservedObject var viewModel: DrawDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.draw.gameName)
                .font(.largeTitle)
                .bold()
                .accessibilityLabel("Game: \(viewModel.draw.gameName)")
            
            Text("Draw Date: \(viewModel.draw.drawDate)")
                .font(.title2)
                .accessibilityLabel("Draw Date: \(viewModel.draw.drawDate)")
            
            VStack(alignment: .leading) {
                Text("Numbers:")
                    .font(.headline)
                HStack {
                    ForEach(viewModel.draw.numbers, id: \.self) { number in
                        NumberView(number: number)
                    }
                }
            }
            
            VStack(alignment: .leading) {
                Text("Bonus Balls:")
                    .font(.headline)
                HStack {
                    ForEach(viewModel.draw.sortedBonusBalls, id: \.self) { bonus in
                        NumberView(number: bonus, isBonus: true)
                    }
                }
            }
            
            Text("Top Prize: \(viewModel.draw.topPrize)")
                .font(.title2)
                .padding(.top, 16)
                .accessibilityLabel("Top Prize: \(viewModel.draw.topPrize)")
            
            Divider()
            
            MyTicketsView (
                realLuckyNumbers: viewModel.draw.numbers,
                realLuckyBonusNumbers: viewModel.draw.bonusBalls,
                ticketNumbers: viewModel.generatedTicketNumbers,
                bonusNumbers: viewModel.generatedTicketBonusNumbers,
                isWinning: viewModel.isWinningTicket
            )
            .accessibilityLabel("Your Lottery Ticket")
            
            Spacer()
        }
        .padding()
        .navigationTitle("Draw Details")
    }
}

#Preview {
    DrawDetailView(viewModel: DrawDetailViewModel(draw: PreviewItems.draw))
}

