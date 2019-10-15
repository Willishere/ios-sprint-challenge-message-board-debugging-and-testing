//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
     let messageThread = MessageThreadController()
    
    func testNewThreadCreated(){
        let count = messageThread.messageThreads.count
        messageThread.createMessageThread(with: "test") {
            XCTAssertTrue(count + 1 == self.messageThread.messageThreads.count )
        }
    }
     
    func testNewMessageCreated(){
        messageThread.createMessageThread(with: "Test") {
            let count = self.messageThread.messageThreads[0].messages.count
            self.messageThread.createMessage(in: self.messageThread.messageThreads[0], withText: "Test", sender: "William") {
                       XCTAssertTrue(count + 1 == self.messageThread.messageThreads[0].messages.count)
                   }
        }
        
       
    }
    
    
}

