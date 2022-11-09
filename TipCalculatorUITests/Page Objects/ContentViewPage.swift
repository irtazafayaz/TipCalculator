//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by Irtaza Fiaz on 09/11/2022.
//

import Foundation
import XCTest

class ContentViewPage {
    
    private var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    public var totalTipTextField: XCUIElement {
        app.textFields["totalTipTextField"]
    }
    
    public var percentageSegmentedControl: XCUIElement {
        app.segmentedControls["percentageSegmentedControl"]
    }
    
    public var calculateTipButton: XCUIElement {
        app.buttons["calculateTipButton"]
    }
    
    public var tipLabelText: XCUIElement {
        app.staticTexts["tipLabelText"]
    }
    
    public var errorMessage: XCUIElement {
        app.staticTexts["errorMessage"]
    }
    
    
}
