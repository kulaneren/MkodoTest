//
//  DrawsView.swift
//  MKODO
//
//  Created by eren k on 02/09/2024.
//

import SwiftUI

struct DrawsView: View {
    @StateObject var viewModel: DrawsViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.lotteryDraws.isEmpty && viewModel.errorMessage == nil {
                ProgressView("Loading lottery draws...")
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            } else {
                List {
                    ForEach(viewModel.groupedDraws.keys.sorted(), id: \.self) { gameId in
                        Section(header: Text(viewModel.gameName(for: gameId))
                            .accessibilityLabel("Game \(viewModel.gameName(for: gameId))")) {
                                listSectionItems(draws: viewModel.groupedDraws[gameId] ?? [])
                            }
                    }
                }
                .accessibilityIdentifier("LotteryDrawsTable")
                .navigationTitle("Lottery Draws")
                .onAppear {
                    viewModel.fetchLotteryData()
                }
            }
        }
    }
    
    // MARK: - Helpers
    
    func listSectionItems(draws: [LotteryDraw]) -> some View {
        ForEach(draws) { draw in
            NavigationLink(destination: DrawsDetailContainerView(draws: draws, initialDraw: draw)) {
                VStack(alignment: .leading) {
                    Text(draw.gameName)
                        .font(.headline)
                        .accessibilityLabel("Game name: \(draw.gameName)")
                    
                    Text("Draw Date: \(draw.drawDate)")
                        .font(.subheadline)
                        .accessibilityLabel("Game name: \(draw.drawDate)")
                    
                    HStack {
                        ForEach(draw.numbers, id: \.self) { number in
                            NumberView(number: number)
                        }
                        ForEach(draw.sortedBonusBalls, id: \.self) { bonus in
                            NumberView(number: bonus, isBonus: true)
                        }
                    }
                }
                .accessibilityElement(children: .combine)
            }
            .accessibilityHint("Tap to view details of this draw")
        }
    }
}

#Preview {
    DrawsView(viewModel: DrawsViewModel(networkService: PreviewItems.lotteryServiceProtocol))
}


