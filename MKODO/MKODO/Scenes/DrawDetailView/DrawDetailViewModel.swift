//
//  DrawDetailViewModel.swift
//  MKODO
//
//  Created by eren k on 02/09/2024.
//

import SwiftUI
import MKODONetwork

final class DrawDetailViewModel: ObservableObject {
    let draw: LotteryDraw
    @Published var isWinningTicket: Bool = false
    @Published var generatedTicketNumbers: [String] = []
    @Published var generatedTicketBonusNumbers: [String] = []
    
    init(draw: LotteryDraw) {
        self.draw = draw
        load()
    }
    
    private func load() {
        generateTicket(
            numberCount: draw.numbers.count,
            bonusBallsCount: draw.bonusBalls.count
        )
        checkIfWinningTicket()
    }
    
    private func generateTicket(numberCount: Int, bonusBallsCount: Int) {
        generatedTicketNumbers = (1...59)
            .shuffled()
            .prefix(numberCount)
            .sorted()
            .map { String($0) }
        
        generatedTicketBonusNumbers = (1...10)
            .shuffled()
            .prefix(bonusBallsCount)
            .sorted()
            .map { String($0) }
        
    }
    
    func checkIfWinningTicket() {
        isWinningTicket = (Set(draw.numbers) == Set(generatedTicketNumbers)) && (Set(draw.bonusBalls) == Set(generatedTicketBonusNumbers))
    }
}

