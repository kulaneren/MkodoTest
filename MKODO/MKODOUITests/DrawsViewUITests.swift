//
//  DrawsViewUITests.swift
//  MKODOUITests
//
//  Created by eren k on 02/09/2024.
//

import XCTest

final class DrawsViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func test_drawDetailsDisplaysCorrectly() throws {
        let collection = app.collectionViews["LotteryDrawsTable"]
        XCTAssertTrue(collection.exists)
        XCTAssertEqual(collection.cells.count, 7)
        XCTAssertTrue(app.staticTexts["Lottery Draws"].exists)
        XCTAssertTrue(app.staticTexts["GAME LOTTO"].exists)
        XCTAssertTrue(app.staticTexts["GAME LOTTO PLUS"].exists)
    }
}

