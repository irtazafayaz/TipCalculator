//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Irtaza Fiaz on 07/11/2022.
//

import XCTest

class when_content_view_is_shown: XCTestCase {

    private var app: XCUIApplication!
    private var contentPage: ContentViewPage!
    
    override func setUp() {
        app = XCUIApplication()
        contentPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
    }
    
    func test_make_sure_text_field_has_default_value() {
        XCTAssertEqual(contentPage.totalTipTextField.value as! String, "Enter total")
    }
    
    func test_make_sure_segmentcontrol_has_20_default_percentage() {
        let button = contentPage.percentageSegmentedControl.buttons.element(boundBy: 1)
        XCTAssertEqual(button.label, "20%")
        XCTAssertTrue(button.isSelected)
    }
    
}

class when_calculate_tip_button_is_tapped_for_valid_input: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentPage: ContentViewPage!

    override func setUp() {
        
        app = XCUIApplication()
        contentPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
        contentPage.totalTipTextField.tap()
        contentPage.totalTipTextField.typeText("100")
        contentPage.calculateTipButton.tap()
        
    }
    
    
    func test_should_make_sure_that_tip_is_displayed() {
        let tipLabel = contentPage.tipLabelText
        let _ = tipLabel.waitForExistence(timeout: 0.5)
        XCTAssertEqual(tipLabel.label, "$20.00")
    }
    
    
}

class when_calculate_tip_is_tapped_for_invalid_input: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentPage: ContentViewPage!

    override func setUp() {
        
        app = XCUIApplication()
        contentPage = ContentViewPage(app: app)
        continueAfterFailure = false
        app.launch()
        
        contentPage.totalTipTextField.tap()
        contentPage.totalTipTextField.typeText("-100")
        contentPage.calculateTipButton.tap()
        
    }
    
    func test_should_make_sure_error_is_displayed() {
        let _ = contentPage.errorMessage.waitForExistence(timeout: 0.5)
        XCTAssertEqual(contentPage.errorMessage.label, "How can total amount be less than 0?")
    }
    
    func test_should_make_sure_tip_label_is_cleared() {
        let _ = contentPage.tipLabelText.waitForExistence(timeout: 0.5)
        XCTAssertEqual(contentPage.tipLabelText.label, "")
    }
    
    
}
