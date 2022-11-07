//
//  TipCalculatorUnitTests.swift
//  TipCalculatorUnitTests
//
//  Created by Irtaza Fiaz on 07/11/2022.
//

import XCTest

class when_calculating_tip_based_on_total_amount: XCTestCase {

    func test_should_calculate_tip_successfully() {
        
        let tipCalculator = TipCalculator()
        let result = try! tipCalculator.calculate(total: 100, percentage: 0.1)
        XCTAssertEqual(result, 10.0)
        
    }
    
}

class when_calculating_tip_based_on_negative_amount: XCTestCase {
    
    func test_should_throw_invalid_output_exception() {
        
        let tipCalculator = TipCalculator()
        XCTAssertThrowsError(try tipCalculator.calculate(total: -100, percentage: 0.1), "") {
            error in
            XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidInput)
        }
        
    }
    
}
