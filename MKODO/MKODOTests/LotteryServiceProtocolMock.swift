//
//  LotteryServiceProtocolMock.swift
//  MKODOTests
//
//  Created by eren k on 02/09/2024.
//

import Foundation
import MKODONetwork

final class LotteryServiceProtocolMock: LotteryServiceProtocol {
    var willReturnError = false
    
    func loadLotteryData(completion: @escaping (Result<[NWLotteryDraw], Error>) -> Void) {
        if !willReturnError {
           let draw1 = NWLotteryDraw(
                gameId: 1 ,
                gameName: "Test Game",
                id: "100",
                drawDate: "2023-05-14",
                number1: "25",
                number2: "30",
                number3: "14",
                number4: "15",
                number5: "1",
                number6: "6",
                bonusBalls: ["5","10"],
                topPrize: 1700000000
            )
            
            let draw2 = NWLotteryDraw(
                gameId: 2 ,
                gameName: "Test Game2",
                id: "101",
                drawDate: "2025-05-14",
                number1: "27",
                number2: "5",
                number3: "24",
                number4: "2",
                number5: "28",
                number6: "26",
                bonusBalls: ["10","15"],
                topPrize: 2700000000
            )
            completion(.success([draw1, draw2]))
        } else {
            completion(.failure(NSError(domain: "Test error code", code: 499)))
        }
    }
}

