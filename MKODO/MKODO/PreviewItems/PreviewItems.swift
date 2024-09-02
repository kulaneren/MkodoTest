//
//  PreviewItems.swift
//  MKODO
//
//  Created by eren k on 02/09/2024.
//

import Foundation
import MKODONetwork

struct PreviewItems {
    static var lotteryServiceProtocol: LotteryServiceProtocol {
        // we can discuss about this class' path
        LotteryServiceProtocolMock()
    }
    
    static var draw: LotteryDraw {
        LotteryDraw(
            gameId: 1 ,
            gameName: "Test Game",
            id: "100",
            drawDate: "2023-05-14",
            number1: "5",
            number2: "6",
            number3: "14",
            number4: "15",
            number5: "25",
            number6: "26",
            bonusBalls: ["5","10"],
            topPrize: 2700000000
        )
    }
}

