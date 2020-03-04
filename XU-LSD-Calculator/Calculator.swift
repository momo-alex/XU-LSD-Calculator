//
//  Calculator.swift
//  XU-LSD-Calculator
//
//  Created by Mona Ghazi on 02.03.20.
//  Copyright © 2020 Impar Disparejos Squad. All rights reserved.
//

import Foundation

struct Calculator {

    // Niclas part --
    private var accumulator: Double? // stores the resiöt in
    private var secondAccumulator: Double?
    private var thirdAccumulator: Double?
    private var calculationOperator: String? // stores first Operator
    private var secondCalculationOperator: String? //stores second Operator
    
    // Stores the calculation result
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    // Stores the calculation result
    var secondResult: Double? {
        get {
            return secondAccumulator
        }
    }
    
    mutating func clearAccumulator() {
        accumulator = nil
        secondAccumulator = nil
        thirdAccumulator = nil
    }
    
    mutating func clearThirdAccumulator() {
        thirdAccumulator = nil
    }
    
    // --
    // Niklas --
    // stores either the first or the second accumulator
    mutating func setAccumulator(_ operand: Double) {
        if (accumulator != nil) {
            // Calculates the result of the first calculation and stores it in secondAccumulator
            // if there already is an operation, then the second operand ist the secondAccumulator
            secondAccumulator = operand
        } else {
            //  if there is no operand yet, then the first thing typed in is accumulator "accumulator"
            accumulator = operand
        }
    }
    // thirdAccumulator necassary for dot before dash
    
    mutating func setThirdAccumulator(_ operand: Double) {
        thirdAccumulator = operand
    }
    
    // Stores the calculation operator
    mutating func setOperator(_ operand: String) { calculationOperator = operand }
    
    mutating func setSecondCalculationOperator(_ operand: String) { secondCalculationOperator = operand }
    
    mutating func checkCalculation() -> Bool {
        if (secondAccumulator != nil) {
            return true
        } else {
            return false
        }
    }
    // --
    // Mona --
    
    mutating func calculateResult() {
        
        print("Perform the calculation: \(accumulator!) \(calculationOperator!) \(secondAccumulator!)")
        
        // Switch-statement for the basic operations, Monas part
        switch calculationOperator {
        case "÷":
            accumulator = accumulator! / secondAccumulator!
        case "x":
            accumulator = accumulator! * secondAccumulator!
        case "-":
            accumulator = accumulator! - secondAccumulator!
        case "+":
            accumulator = accumulator! + secondAccumulator!
        default:
            return
        }
    }
    
    mutating func calculateMultiplicationOrDivision() {
        print("Perform the calculation: \(secondAccumulator!) \(secondCalculationOperator!) \(thirdAccumulator!)")
        // Switch-statement for the basic operations, Monas part, Punkt vor Strich
        switch secondCalculationOperator {
        case "÷":
            secondAccumulator = secondAccumulator! / thirdAccumulator!
        case "x":
            secondAccumulator = secondAccumulator! * thirdAccumulator!
        default:
            return
        }
    }
    
    // --
}


