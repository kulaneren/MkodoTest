//
//  DrawDetailViewModelTests.swift
//  MKODOTests
//
//  Created by eren k on 02/09/2024.
//

import XCTest
@testable import MKODO

final class DrawDetailViewModelTests: XCTestCase {
    
    var sut: DrawDetailViewModel!
    let draw = LotteryDraw(
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

    override func setUpWithError() throws {
        sut = DrawDetailViewModel(draw: draw)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_init() {
        XCTAssertEqual(sut.generatedTicketNumbers.count, 6)
        XCTAssertEqual(sut.generatedTicketBonusNumbers.count, 2)
        XCTAssertNotNil(sut.isWinningTicket)
    }
    
    func test_checkIfWinningTicketWithSuccess() {
        sut.generatedTicketNumbers = ["5", "6", "14", "15", "25", "26"]
        sut.generatedTicketBonusNumbers = ["5", "10"]
        
        sut.checkIfWinningTicket()
        
        XCTAssertTrue(sut.isWinningTicket)
    }
    
    func test_checkIfWinningTicketWithFailure() {
        // second item is different than draw
        sut.generatedTicketNumbers = ["5", "7", "14", "15", "25", "26"]
        sut.generatedTicketBonusNumbers = ["5", "10"]
        
        sut.checkIfWinningTicket()
        
        XCTAssertFalse(sut.isWinningTicket)
    }
}

