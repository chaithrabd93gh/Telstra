//
//  MyAppTests.swift
//  MyAppTests
//
//  Created by chaithra on 11/02/20.
//  Copyright © 2020 chaithra. All rights reserved.
//

import XCTest
@testable import MyApp

class MyAppTests: XCTestCase {
    var sut: CountriesViewModel!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testNetworkCall() {
        let e = expectation(description: "200")
        
        DataManager.shared.getData { (countries, error) in
            if let _ = countries {
                e.fulfill()
            } else if let err = error {
                XCTFail("Error: \(err)")
            }
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
