//
//  DrawsViewModelTests.swift
//  MKODOTests
//
//  Created by eren k on 02/09/2024.
//

import XCTest
@testable import MKODO

final class DrawsViewModelTests: XCTestCase {
    
    var sut: DrawsViewModel!
    var network: LotteryServiceProtocolMock!
    
    override func setUpWithError() throws {
        // init URLMock and urlsession here
        network = LotteryServiceProtocolMock()
        sut = DrawsViewModel(networkService: network)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        network = nil
    }
    
    func test_fetchLotteryDataWithSuccess() {
        let loadExpectation = expectation(description: "loadExpectation")
        let result = XCTWaiter.wait(for: [loadExpectation], timeout: 2.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNil(sut.errorMessage)
            XCTAssertEqual(sut.lotteryDraws.count, 2)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_fetchLotteryDataWithFail() {
        network.willReturnError = true
        sut.fetchLotteryData()
        let failExpectation = expectation(description: "failExpectation")
        let result = XCTWaiter.wait(for: [failExpectation], timeout: 2.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(sut.errorMessage)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_checkSortedDrawNumbers() {
        let numbersExpectation = expectation(description: "numbersExpectation")
        let result = XCTWaiter.wait(for: [numbersExpectation], timeout: 2.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(sut.lotteryDraws.first!.numbers[0], "2")
            XCTAssertEqual(sut.lotteryDraws.first!.numbers[5], "28")
            XCTAssertEqual(sut.lotteryDraws.last!.numbers[0], "1")
            XCTAssertEqual(sut.lotteryDraws.last!.numbers[5], "30")
        } else {
            XCTFail("Delay interrupted")
        }
    }
}

