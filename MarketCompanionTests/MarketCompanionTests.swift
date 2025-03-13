//
//  MarketCompanionTests.swift
//  MarketCompanionTests
//
//  Created by Yuvraj Rahul Patkar on 10/03/2025.
//


import XCTest
@testable import MarketCompanion



final class MarketCompanionTests: XCTestCase {

    func testRoundedFunction() {
        let expectation = String(234.24)
        let result = rounded(input: 234.2385)

        XCTAssertEqual(result, expectation)
    }
}

