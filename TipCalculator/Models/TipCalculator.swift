//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Irtaza Fiaz on 07/11/2022.
//

import Foundation

enum TipCalculatorError: Error {
    case invalidInput
}

class TipCalculator {
    
    func calculate(total: Double, percentage: Double) throws -> Double {
        if total < 0 {
            throw TipCalculatorError.invalidInput
        }
        return total * percentage
    }
    
}
