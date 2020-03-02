//
//  Calculator.swift
//  XU-LSD-Calculator
//
//  Created by Mona Ghazi on 02.03.20.
//  Copyright © 2020 Impar Disparejos Squad. All rights reserved.
//

import Foundation

struct Calculator {

    private var accumulator: Double?
    private var secondAccumulator: Double?
    private var calculationOperator: String?
    
    // Stores the calculation result
    var result: Double? {
        get {
            return accumulator
        }
    }

    // Stores the first number in the accumulator
    mutating func setAccumulator(_ operand: Double) {
        if (accumulator != nil) {
            // Rechne das Ergebnis der ersten Rechnung aus und speichere es im Akkumulator
            // wenn es bereits einen Operaten gibt, dann wird der zweite zum secondAccumulator
            secondAccumulator = operand
        } else {
            // wenn es noch keinen Operanten gibt, dann ist das erste Eingegebene der erste Akkumulator "accumulator"
            accumulator = operand
        }
    }
    
    // Stores the calculation operator
    mutating func setOperator(_ operand: String) { calculationOperator = operand }
    
    mutating func clearAccumulator() {
        accumulator = nil
        secondAccumulator = nil
    }
    
    mutating func checkCalculation() -> Bool {
        if (secondAccumulator != nil) {
            return true
        } else {
            return false
        }
    }
    
    mutating func calculateResult() {
        
        print("Perform the calculation: \(accumulator!) \(calculationOperator!) \(secondAccumulator!)")
        
        // Monas part
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

}


