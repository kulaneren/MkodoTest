//
//  LotteryDraw.swift
//  MkodoUI
//
//  Created by eren k on 01/09/2024.
//

import Foundation
import MkodoNetwork

struct LotteryDraw: Identifiable {
    let gameId: Int
    let gameName: String
    let id: String
    let drawDate: String
    let number1: String
    let number2: String
    let number3: String
    let number4: String
    let number5: String
    let number6: String?
    let bonusBalls: [String]
    let topPrize: Int
    
    var numbers: [String] {
        [number1, number2, number3, number4, number5, number6]
            .compactMap { $0 }  // Removes nil values
            .filter { !$0.isEmpty }  // Removes empty strings
            .compactMap { Int($0) }  // Converts to Int, filtering out any non-integer values
            .sorted()  // Sorts the numbers in ascending order
            .map { String($0) }  // Converts back to strings
    }
    
    var sortedBonusBalls: [String] {
        bonusBalls
            .compactMap { Int($0) }  // Converts to Int, filtering out any non-integer values
            .sorted()  // Sorts the numbers in ascending order
            .map { String($0) }  // Converts back to strings
    }
}

extension LotteryDraw {
    init(with networkModel: NWLotteryDraw) {
        self.gameId = networkModel.gameId
        self.gameName = networkModel.gameName
        self.id = networkModel.id
        self.drawDate = networkModel.drawDate
        self.number1 = networkModel.number1
        self.number2 = networkModel.number2
        self.number3 = networkModel.number3
        self.number4 = networkModel.number4
        self.number5 = networkModel.number5
        self.number6 = networkModel.number6
        self.bonusBalls = networkModel.bonusBalls
        self.topPrize = networkModel.topPrize
    }
}
