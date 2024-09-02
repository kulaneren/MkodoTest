//
//  MKODOApp.swift
//  MKODO
//
//  Created by eren k on 02/09/2024.
//

import SwiftUI
import MKODONetwork

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
