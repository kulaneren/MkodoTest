//
//  MkodoUIApp.swift
//  MkodoUI
//
//  Created by eren k on 30/08/2024.
//

import SwiftUI
import MkodoNetwork

@main
struct MkodoUIApp: App {
    var body: some Scene {
        WindowGroup {
            DrawsView(
                viewModel: DrawsViewModel(
                    networkService: LotteryService.shared
                )
            )
        }
    }
}
