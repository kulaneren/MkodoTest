//
//  LotteryServiceTests.swift
//  MKODONetworkTests
//
//  Created by eren k on 02/09/2024.
//

import XCTest
@testable import MKODONetwork

final class LotteryServiceTests: XCTestCase {

    var lotteryService: LotteryService!

    override func setUpWithError() throws {
        // init URLMock and urlsession here
        lotteryService = LotteryService.shared
    }

    override func tearDownWithError() throws {
        lotteryService = nil
    }
    
    func test_GetLotteries() {
        // get text json here, covert to data and use it to return in Mock: URLProtocol
        
        let lotteryExpectation = expectation(description: "Expectation")
        lotteryService.loadLotteryData { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data.count, 5)
            case .failure(let failure):
                XCTAssertNil(failure)
            }
            lotteryExpectation.fulfill()
        }
        wait(for: [lotteryExpectation], timeout: 3.0)
    }
}

