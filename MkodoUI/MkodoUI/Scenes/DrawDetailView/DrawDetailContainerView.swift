//
//  DrawDetailContainerView.swift
//  MkodoUI
//
//  Created by eren k on 01/09/2024.
//

import SwiftUI

struct DrawsDetailContainerView: View {
    let draws: [LotteryDraw]
    
    @State private var selectedIndex: Int
    
    init(draws: [LotteryDraw], initialDraw: LotteryDraw) {
        self.draws = draws
        if let index = draws.firstIndex(where: { $0.id == initialDraw.id }) {
            self._selectedIndex = State(initialValue: index)
        } else {
            self._selectedIndex = State(initialValue: 0)
        }
    }
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(draws.indices, id: \.self) { index in
                DrawDetailView(viewModel: DrawDetailViewModel(draw: draws[index]))
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .navigationBarTitle("Draw Details", displayMode: .inline)
    }
}
