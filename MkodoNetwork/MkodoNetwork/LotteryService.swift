//
//  NetworkManager.swift
//  MkodoNetwork
//
//  Created by eren k on 30/08/2024.
//

import Foundation

public protocol LotteryServiceProtocol {
    func loadLotteryData(completion: @escaping (Result<[NWLotteryDraw], Error>) -> Void)
}

final public class LotteryService: LotteryServiceProtocol {
    
    public static let shared = LotteryService()
    
    private init () {}
    
    // Function to load JSON data (locally for now)
    public func loadLotteryData(completion: @escaping (Result<[NWLotteryDraw], Error>) -> Void) {
        // it didn't work here I checked COPY BUNDLE RESOURCES etc... but it was unsuccessful
//        guard let url = Bundle.main.url(forResource: "lottery_data", withExtension: "json") else {
//            completion(.failure(NSError(domain: "Invalid File URL", code: -1, userInfo: nil)))
//            return
//        }
        
        do {
//            let data = try Data(contentsOf: url)
            let lotteryDraws = try JSONDecoder().decode(NWLotteryDraws.self, from: lotteryData)
            completion(.success(lotteryDraws.draws))
        } catch {
            completion(.failure(error))
        }
    }
}

// MARK: - Swift concurrency implementation

//final class LotteryService {
//
//    static let shared = LotteryService()
//
//    // Function to load JSON data using Swift Concurrency
//    func loadLotteryData() async throws -> [LotteryDraw] {
//        guard let url = Bundle.main.url(forResource: "lottery_data", withExtension: "json") else {
//            throw NSError(domain: "Invalid File URL", code: -1, userInfo: nil)
//        }
//
//        let (data, _) = try await URLSession.shared.data(from: url)
//        let lotteryDraws = try JSONDecoder().decode(LotteryDraws.self, from: data)
//        return lotteryDraws.draws
//    }
//}


let lotteryData: Data =
"""
{
    "draws": [
        {
            "gameId": 1,
            "gameName" : "Lotto",
            "id": "draw-1",
            "drawDate": "2023-05-15",
            "number1": "2",
            "number2": "16",
            "number3": "23",
            "number4": "44",
            "number5": "47",
            "number6": "52",
            "bonus-balls": ["14"],
            "topPrize": 4000000000
        },
        {
            "gameId": 1,
            "gameName" : "Lotto",
            "id": "draw-2",
            "drawDate": "2023-05-22",
            "number1": "5",
            "number2": "45",
            "number3": "51",
            "number4": "32",
            "number5": "24",
            "number6": "18",
            "bonus-balls": ["28"],
            "topPrize": 6000000000
        },
        {
            "gameId": 1,
            "gameName" : "Lotto",
            "id": "draw-3",
            "drawDate": "2023-05-29",
            "number1": "34",
            "number2": "21",
            "number3": "4",
            "number4": "58",
            "number5": "1",
            "number6": "15",
            "bonus-balls": ["51"],
            "topPrize": 6000000000
        },
        {
            "gameId": 6,
            "gameName" : "Lotto Plus",
            "id": "draw-4",
            "drawDate": "2023-05-14",
            "number1": "5",
            "number2": "45",
            "number3": "51",
            "number4": "32",
            "number5": "24",
            "bonus-balls": ["28", "31"],
            "topPrize": 2700000000
        },
        {
            "gameId": 6,
            "gameName" : "Lotto Plus",
            "id": "draw-5",
            "drawDate": "2023-06-25",
            "number1": "34",
            "number2": "21",
            "number3": "4",
            "number4": "58",
            "number5": "1",
            "bonus-balls": ["51", "23"],
            "topPrize": 2800000000
        }
    ]
}
""".data(using: .utf8)!
