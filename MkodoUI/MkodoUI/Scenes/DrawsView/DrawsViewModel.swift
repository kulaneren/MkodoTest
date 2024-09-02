//
//  DrawsViewModel.swift
//  MkodoUI
//
//  Created by eren k on 30/08/2024.
//

import SwiftUI
import MkodoNetwork

final class DrawsViewModel: ObservableObject {
    @Published var lotteryDraws: [LotteryDraw] = []
    @Published var errorMessage: String?
    var networkService: LotteryServiceProtocol
    
    init(networkService: LotteryServiceProtocol) {
        self.networkService = networkService
        fetchLotteryData()
    }
    
    var groupedDraws: [Int: [LotteryDraw]] {
        Dictionary(grouping: lotteryDraws, by: { $0.gameId })
    }
    
    func fetchLotteryData() {
        networkService.loadLotteryData { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let draws):
                    self.lotteryDraws = draws.map{
                        LotteryDraw(with: $0)
                    }.sorted(by: {
                        $0.drawDate > $1.drawDate
                    })
                    //                    self.lotteryDraws = temp.sorted(by: { $0.drawDate > $1.drawDate })
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func gameName(for gameId: Int) -> String {
        lotteryDraws.first(where: { $0.gameId == gameId })?.gameName ?? "Unknown Game"
    }
}


// MARK: - Swift concurrency implementation

//final class DrawsViewModel: ObservableObject {
//    @Published var lotteryDraws: [LotteryDraw] = []
//    @Published var errorMessage: String?
//
//    init() {
//        Task {
//            await fetchLotteryData()
//        }
//    }
//
//    func fetchLotteryData() async {
//        do {
//            let draws = try await LotteryService.shared.loadLotteryData()
//            DispatchQueue.main.async {
//                self.lotteryDraws = draws.sorted(by: { $0.drawDate > $1.drawDate })
//            }
//        } catch {
//            DispatchQueue.main.async {
//                self.errorMessage = error.localizedDescription
//            }
//        }
//    }
//}

