//
//  Message_BoardUITests.swift
//  Message BoardUITests
//
//  Created by Spencer Curtis on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class Message_BoardUITests: XCTestCase {
    override func setUp() {
           super.setUp()
           
           continueAfterFailure = false
           app = XCUIApplication()
           
           // NOTE: Keep this setup as is for UI Testing
           app.launchArguments = ["UITesting"]
           app.launch()
       }
    
    var app: XCUIApplication!
     
     func testNewThreadCreated(){
        let messageTable = app.tables.matching(identifier: "MessageThreadsTableViewController")
        let textField = messageTable.textFields["Create a new thread:"]
        textField.tap()
        textField.typeText("William\n")
        let cell = messageTable.cells.staticTexts["William"]
        XCTAssertEqual(cell.label, "William")
   
    
}

    func testNewMessageInThread(){
        let messageTable = app.tables.matching(identifier: "MessageThreadsTableViewController")
        let textField = messageTable.textFields["Create a new thread:"]
        textField.tap()
        textField.typeText("William")
        textField.typeText("\n")
        let cell = messageTable.cells.staticTexts["William"]
       
        cell.tap()
        let novelMessageButton = app.navigationBars["William"].buttons["Add"]
        novelMessageButton.tap()
        let nameTextField = app.textFields["Enter your name:"]
        nameTextField.tap()
        nameTextField.typeText("Will_I_Am")
        let deliverButton = app.navigationBars["New Message"].buttons["Send"]
        deliverButton.tap()
        let messagesThreadTable = app.tables.matching(identifier: "MessageThreadDetailTableViewController")
        let messagesCell = messagesThreadTable.cells.staticTexts["Will_I_Am"]
        XCTAssertEqual(messagesCell.label, "Will_I_Am")
        
        
    }
}
