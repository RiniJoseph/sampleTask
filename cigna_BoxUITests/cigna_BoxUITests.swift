//
//  cigna_BoxUITests.swift
//  cigna_BoxUITests
//
//  Created by cccuser on 07/06/17.
//  Copyright © 2017 cccuser. All rights reserved.
//

import XCTest

class cigna_BoxUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
      
   
    }
  
  func testEmptyTextfield() {
    
    let app = XCUIApplication()
    let countTextField = app.textFields["Enter the count"]
    countTextField.tap()
    
    let submitButton = app.buttons["Submit"]
    submitButton.tap()
    
    let emptyAlert = app.alerts
    XCTAssertTrue(emptyAlert.element.exists)
    let emptyAlertText = emptyAlert.staticTexts["Count cannot be empty!!"]
    XCTAssertTrue(emptyAlertText.exists)
    let okButton = emptyAlert.buttons["OK"]
    XCTAssertTrue(okButton.exists)
  }
  
  
  func testMaximumCount() {
    let app = XCUIApplication()
    let countTextField = app.textFields["Enter the count"]
    countTextField.tap()
    countTextField.typeText("20")
    let submitButton = app.buttons["Submit"]
    submitButton.tap()
    let countAlert = app.alerts
    XCTAssertTrue(countAlert.element.exists)
    let countAlertText = countAlert.staticTexts[String(format:"Enter a count less than %@",AppConstants.maxCount)]
    XCTAssertTrue(countAlertText.exists)
    let okButton = countAlert.buttons["OK"]
    XCTAssertTrue(okButton.exists)


  }
  
  
  func testBoxCount() {
    let app = XCUIApplication()
    let countTextField = app.textFields["Enter the count"]
    countTextField.tap()
    countTextField.typeText("3")
    let submitButton = app.buttons["Submit"]
    submitButton.tap()
    let collectionViewsQuery = app.collectionViews
    let firstBox =  collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element
    XCTAssertTrue(firstBox.exists)
    let secondBox = collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element
    XCTAssertTrue(secondBox.exists)
    let thirdBox = collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element
    XCTAssertTrue(thirdBox.exists)
    app.buttons["Clear text"].tap()

    
    
  }
}
