//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Irtaza Fiaz on 07/11/2022.
//

import XCTest

class when_content_view_is_shown: XCTestCase {

    func test_make_sure_text_field_has_default_value() {
        
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let totalTextField = app.textFields["totalTipTextField"]
        XCTAssertEqual(totalTextField.value as! String, "Enter total")
        
    }
    
    func test_make_sure_segmentcontrol_has_20_default_percentage() {
        
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        
        let segmentedControls = app.segmentedControls["percentageSegmentedControl"]
        let button = segmentedControls.buttons.element(boundBy: 1)
        
        XCTAssertEqual(button.label, "20%")
        
    }
    
    
}
