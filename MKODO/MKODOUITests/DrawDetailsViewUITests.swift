//
//  DrawDetailsViewUITests.swift
//  MKODOUITests
//
//  Created by eren k on 02/09/2024.
//

import XCTest

final class DrawDetailsViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        XCUIApplication().collectionViews["LotteryDrawsTable"]/*@START_MENU_TOKEN@*/.cells.staticTexts["Game name: Lotto, Game name: 2023-05-29, Number: 1, Number: 4, Number: 15, Number: 21, Number: 34, Number: 58, Bonus Ball: 51"]/*[[".cells",".buttons[\"Game name: Lotto, Game name: 2023-05-29, Number: 1, Number: 4, Number: 15, Number: 21, Number: 34, Number: 58, Bonus Ball: 51\"].staticTexts[\"Game name: Lotto, Game name: 2023-05-29, Number: 1, Number: 4, Number: 15, Number: 21, Number: 34, Number: 58, Bonus Ball: 51\"]",".staticTexts[\"Game name: Lotto, Game name: 2023-05-29, Number: 1, Number: 4, Number: 15, Number: 21, Number: 34, Number: 58, Bonus Ball: 51\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[2,0]]@END_MENU_TOKEN@*/.tap()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func test_drawsListDisplaysCorrectly() throws {
        XCTAssertTrue(app.staticTexts["Draw Details"].exists)
        XCTAssertTrue(app.staticTexts["Numbers:"].exists)
        XCTAssertTrue(app.staticTexts["Number: 1"].exists)
        XCTAssertTrue(app.staticTexts["Top Prize: 6,000,000,000"].exists)
    }
}

