//
//  Bowling ScoresUITestCS3260.swift
//  Bowling ScoresUITests
//
//  Created by Ted Cowan on 9/20/18.
//  Copyright © 2018 TedCowan. All rights reserved.
//

import XCTest

class Bowling_ScoresUITestCS3260: XCTestCase {
    var app: XCUIApplication!
    var device: XCUIDevice!
    var game1Label, game2Label, game3Label: XCUIElement!
    var game1Value, game2Value, game3Value: XCUIElement!
    var calculateButton: XCUIElement!
    var seriesLabel, highLabel, averageLabel: XCUIElement!
    var seriesValue, highValue, averageValue: XCUIElement!
    
    let portraitSizes = ["Game 1" : (x:16.0, y:36.0, w:191.0, h:30.0), "game1" : (x:207.0, y:36.0, w:191.0, h:30.0),
                         "Game 2" : (x:16.0, y:76.0, w:191.0, h:30.0), "game2" : (x:207.0, y:76.0, w:191.0, h:30.0),
                         "Game 3" : (x:16.0, y:116.0, w:191.0, h:30.0), "game3" : (x:207.0, y:116.0, w:191.0, h:30.0),
                         "Calculate" : (x:16.0, y:156.0, w:382.0, h:30.0),
                         "Series" : (x:16.0, y:196.0, w:191.0, h:20.3), "series" : (x:207.0, y:196.0, w:191.0, h:20.3),
                         "Average" : (x:16.0, y:257.7, w:191.0, h:20.3), "average" : (x:207.0, y:226.3, w:191.0, h:20.3),
                         "High" : (x:16.0, y:156.0, w:191.0, h:20.3), "high" : (x:207.0, y:256.7, w:191.0, h:20.3) ]
    
    let landscapeLeftSizes = ["Game 1" : (x:16.0, y:16.0, w:352.0, h:30.0), "game1" : (x:368.0, y:16.0, w:352.0, h:30.0),
                              "Game 2" : (x:16.0, y:56.0, w:352.0, h:30.0), "game2" : (x:368.0, y:56.0, w:352.0, h:30.0),
                              "Game 3" : (x:16.0, y:96.0, w:352.0, h:30.0), "game3" : (x:368.0, y:96.0, w:352.0, h:30.0),
                              "Calculate" : (x:16.0, y:136, w:704.0, h:30.0),
                              "Series" : (x:16.0, y:176.0, w:352.0, h:20.3), "series" : (x:368.0, y:176.0, w:352.0, h:20.3),
                              "Average" : (x:16.0, y:206.3, w:352.0, h:20.3), "average" : (x:368.0, y:206.3, w:352.0, h:20.3),
                              "High" : (x:16.0, y:236.7, w:352.0, h:20.3), "high" : (x:368.0, y:236.7, w:352.0, h:20.3) ]

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        //continueAfterFailure = false
        
        // Allowing all tests to run to maximize points
        continueAfterFailure = true
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        device = XCUIDevice.shared
        device.orientation = .portrait
        
        game1Label = app.staticTexts["Game 1"]
        //XCTAssert(game1Label.exists, "No Game 1 Label found")
        game1Value = app.textFields["game1"]
        //XCTAssert(game1Value.exists, "No text field with identifier game1 found")
        
        game2Label = app.staticTexts["Game 2"]
        //XCTAssert(game2Label.exists, "No Game 2 Label found")
        game2Value = app.textFields["game2"]
        //XCTAssert(game2Value.exists, "No text field with identifier game2 found")
        
        game3Label = app.staticTexts["Game 3"]
        //XCTAssert(game3Label.exists, "No Game 3 Label found")
        game3Value = app.textFields["game3"]
        //XCTAssert(game3Value.exists, "No text field with identifier game3 found")

        calculateButton = app.buttons["Calculate"]
        //XCTAssert(calculateButton.exists, "No button labeled Calculate found")

        seriesLabel = app.staticTexts["Series"]
        //XCTAssert(seriesLabel.exists, "No Series Label found")
        let seriesValueElementsQuery = app.otherElements.containing(.staticText, identifier:"series")
        seriesValue = seriesValueElementsQuery.children(matching: .staticText).element(boundBy: 1)
        //XCTAssert(seriesValue.exists, "No text field with identifier series found")
        
        averageLabel = app.staticTexts["Average"]
        //XCTAssert(averageLabel.exists, "No Average Label found")
        let averageValueElementsQuery = app.otherElements.containing(.staticText, identifier:"average")
        averageValue = averageValueElementsQuery.children(matching: .staticText).element(boundBy: 1)
        //XCTAssert(averageValue.exists, "No text field with identifier ave found")
 
        highLabel = app.staticTexts["High"]
        //XCTAssert(highLabel.exists, "No High Label found")
        let highValueElementsQuery = app.otherElements.containing(.staticText, identifier:"high")
        highValue = highValueElementsQuery.children(matching: .staticText).element(boundBy: 1)
        //XCTAssert(highValue.exists, "No text field with identifier high found")

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        device.orientation = .portrait
    }
    
    func testAllFieldsFound() {
        XCTAssert(game1Label.exists, "No Game 1 Label found")
        XCTAssert(game1Value.exists, "No text field with identifier game1 found")
        
        XCTAssert(game2Label.exists, "No Game 2 Label found")
        XCTAssert(game2Value.exists, "No text field with identifier game2 found")
        
        XCTAssert(game3Label.exists, "No Game 3 Label found")
        XCTAssert(game3Value.exists, "No text field with identifier game3 found")
        
        XCTAssert(calculateButton.exists, "No button labeled Calculate found")
        
        XCTAssert(seriesLabel.exists, "No Series Label found")
        XCTAssert(seriesValue.exists, "No text field with identifier series found")
        
        XCTAssert(averageLabel.exists, "No Average Label found")
        XCTAssert(averageValue.exists, "No text field with identifier ave found")
        
        XCTAssert(highLabel.exists, "No High Label found")
        XCTAssert(highValue.exists, "No text field with identifier high found")

    }
    
    func testPortraitMode() {
        var x, y: Double
        var cX, cY: CGFloat
        device.orientation = .portrait
        
        cX = game1Label.frame.minX
        cY = game1Label.frame.minY
        (x, y, _, _) = portraitSizes["Game 1"]!
        XCTAssert(CGFloat(x).roundTo(1) == cX && CGFloat(y).roundTo(1) == cY.roundTo(1),
                  "Game 1 label found at (\(cX),\(cY)), should be at (\(x),\(y))")
        
        cX = calculateButton.frame.minX
        cY = calculateButton.frame.minY
        (x, y, _, _) = portraitSizes["Calculate"]!
        XCTAssert(CGFloat(x).roundTo(1) == cX.roundTo(1) && CGFloat(y).roundTo(1) == cY.roundTo(1),
                  "Calculate button found at (\(cX),\(cY)), should be at (\(x),\(y))")
        
        cX = highValue.frame.minX
        cY = highValue.frame.minY
        (x, y, _, _) = portraitSizes["high"]!
        XCTAssert(CGFloat(x).roundTo(1) == cX.roundTo(1) && CGFloat(y).roundTo(1) == cY.roundTo(1),
                  "high text field found at (\(cX.roundTo(1)),\(cY.roundTo(1))), should be at (\(x),\(y))")
    }
    
    func testLandscapeLeftMode() {
        var x, y: Double
        var cX, cY: CGFloat
        device.orientation = .landscapeLeft
        
        cX = game1Label.frame.minX
        cY = game1Label.frame.minY
        (x, y, _, _) = landscapeLeftSizes["Game 1"]!
        XCTAssert(CGFloat(x).roundTo(1) == cX && CGFloat(y).roundTo(1) == cY.roundTo(1),
                  "Game 1 label found at (\(cX.roundTo(1)),\(cY.roundTo(1))), should be at (\(x),\(y))")
        
        cX = calculateButton.frame.minX
        cY = calculateButton.frame.minY
        (x, y, _, _) = landscapeLeftSizes["Calculate"]!
        XCTAssert(CGFloat(x).roundTo(1)  == cX.roundTo(1) && CGFloat(y).roundTo(1) == cY.roundTo(1),
                  "Calculate button found at (\(cX.roundTo(1)),\(cY.roundTo(1))), should be at (\(x),\(y))")
        
        cX = highValue.frame.minX
        cY = highValue.frame.minY
        (x, y, _, _) = landscapeLeftSizes["high"]!
        XCTAssert(CGFloat(x).roundTo(1) == cX.roundTo(1) && CGFloat(y).roundTo(1) == cY.roundTo(1),
                  "high text field found at (\(cX.roundTo(1)),\(cY.roundTo(1))), should be at (\(x),\(y))")

    }
    
    func testBasicCalculations() {
        game1Value.tap()
        game1Value.typeText("100")
        
        game2Value.tap()
        game2Value.typeText("200")
        
        game3Value.tap()
        game3Value.typeText("300")
        app.buttons["Calculate"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").label, "600", "Series does not equal 600")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").label, "200", "Average does not equal 200")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").label, "300", "High does not equal 300")
    }
    
    func testAllZeroes() {
        game1Value.tap()
        game1Value.typeText("0")
        
        game2Value.tap()
        game2Value.typeText("0")
        
        game3Value.tap()
        game3Value.typeText("0")
        app.buttons["Calculate"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").label, "0")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").label, "0")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").label, "0")
    }
    
    func testZero100100() {
        game1Value.tap()
        game1Value.typeText("0")
        
        game2Value.tap()
        game2Value.typeText("100")
        
        game3Value.tap()
        game3Value.typeText("100")
        app.buttons["Calculate"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").label, "200")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").label, "100")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").label, "100")
    }
    
    func testNonAlphaEntries() {
        game1Value.tap()
        game1Value.typeText("mickey")
        
        game2Value.tap()
        game2Value.typeText("donald")
        
        game3Value.tap()
        game3Value.typeText("minnie")
        app.buttons["Calculate"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").label, "0")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").label, "0")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").label, "0")
    }
    
    func testKeyboardDisappearsOnCalculate() {
        
        XCTAssert(app.keyboards.count == 0, "The keyboard is visible and should not yet be")
        game1Value.tap()
        XCTAssert(app.keyboards.count > 0, "The keyboard is not visible and should be on first tap")
        game1Value.typeText("99")
        
        game2Value.tap()
        XCTAssert(app.keyboards.count > 0, "The keyboard is not visible and should be on second tap")
        game2Value.typeText("88")
    
        game3Value.tap()
        XCTAssert(app.keyboards.count > 0, "The keyboard is not visible and should be on third tap")
        game3Value.typeText("77")
        
        app.buttons["Calculate"].tap()
        XCTAssert(app.keyboards.count == 0, "The keyboard is visible and should disappear when Calculate button is tapped")

        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").label, "264")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").label, "88")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").label, "99")
    }
    
    func testIntegerMathRoundingDown() {
        game1Value.tap()
        game1Value.typeText("101")
        
        game2Value.tap()
        game2Value.typeText("105")
        
        game3Value.tap()
        game3Value.typeText("107")
        app.buttons["Calculate"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").label, "313")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").label, "104")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").label, "107")
    }
    
    func testIntegerMathNotRoundingUp() {
        game1Value.tap()
        game1Value.typeText("105")
        
        game2Value.tap()
        game2Value.typeText("105")
        
        game3Value.tap()
        game3Value.typeText("107")
        app.buttons["Calculate"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").label, "317")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").label, "105")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").label, "107")
    }

    
}

extension Double {
    func roundTo(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension CGFloat {
    func roundTo(_ places:Int) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        return (self * divisor).rounded() / divisor
    }
}

