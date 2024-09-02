//
//  NWLotteryDraws.swift
//  MKODONetwork
//
//  Created by eren k on 02/09/2024.
//

import Foundation

public struct NWLotteryDraws: Codable {
    let draws: [NWLotteryDraw]
}

// MARK: - Draw
public struct NWLotteryDraw: Codable, Identifiable {
   
    public let gameId: Int
    public let gameName: String
    public let id: String
    public let drawDate: String
    public let number1: String
    public let number2: String
    public let number3: String
    public let number4: String
    public let number5: String
    public let number6: String?
    public let bonusBalls: [String]
    public let topPrize: Int
    
    enum CodingKeys: String, CodingKey {
        case gameId = "gameId"
        case gameName, id, drawDate, number1, number2, number3, number4, number5, number6
        case bonusBalls = "bonus-balls"
        case topPrize
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gameId = try values.decode(Int.self, forKey: .gameId)
        gameName = try values.decode(String.self, forKey: .gameName)
        id = try values.decode(String.self, forKey: .id)
        drawDate = try values.decode(String.self, forKey: .drawDate)
        number1 = try values.decode(String.self, forKey: .number1)
        number2 = try values.decode(String.self, forKey: .number2)
        number3 = try values.decode(String.self, forKey: .number3)
        number4 = try values.decode(String.self, forKey: .number4)
        number5 = try values.decode(String.self, forKey: .number5)
        number6 = try values.decodeIfPresent(String.self, forKey: .number6)
        bonusBalls = try values.decode([String].self, forKey: .bonusBalls)
        topPrize = try values.decode(Int.self, forKey: .topPrize)
    }
    
    public init(gameId: Int, gameName: String, id: String, drawDate: String, number1: String, number2: String, number3: String, number4: String, number5: String, number6: String? = nil, bonusBalls: [String], topPrize: Int) {
        self.gameId = gameId
        self.gameName = gameName
        self.id = id
        self.drawDate = drawDate
        self.number1 = number1
        self.number2 = number2
        self.number3 = number3
        self.number4 = number4
        self.number5 = number5
        self.number6 = number6
        self.bonusBalls = bonusBalls
        self.topPrize = topPrize
    }
}

