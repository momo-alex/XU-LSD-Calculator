//
//  ViewController.swift
//  XU-LSD-Calculator
//
//  Created by Mona Ghazi on 02.03.20.
//  Copyright © 2020 Impar Disparejos Squad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Niclas part --
    var currentCalculation: Calculator = Calculator()
    var isTyping = false
    var mathLaw = false
    
    // Represents the value on the calculator display
    var displayLabelValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(round(1000*newValue)/1000) // as it is shown, we calculate with doubles that have a limited number of bits, so the number of bits is 0.3+0.6 = 0.899, so we limit the decimal places to 2, with float it works better but not with all numbers
        }
    }
    // buttons added with control + hold, Monas part
    
    @IBOutlet weak var displayLabel: UILabel!
    
    // @IBOutlet var calculatorButtonsCollection: [UIButton]!
    
    // Is executed when one of the calculator buttons is pressed
    @IBAction func calculatorButtonPressed(_ sender: UIButton) {
        // sender => current button that is clicked, title equals constant
        let buttonString = sender.currentTitle!
        // number input, Niclas part
        switch buttonString {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            // if true that user already typed a number, then the numbers will be displayed
            if isTyping {
                let currentDisplayText = displayLabel.text!
                displayLabel.text = currentDisplayText + buttonString
            } else {
                // if false, then buttonString will be displayed, so the part that was typed in at the beginning
                isTyping = true
                displayLabel.text = buttonString
            }
        case ".":
            let currentDisplayText = displayLabel.text!
            displayLabel.text = currentDisplayText + buttonString
        case "+/-":
            displayLabelValue *= -1
        // --
        // Monas part --
        case "÷", "x", "-", "+":
            // currentCalculation.setAccumulator(displayLabelValue)
            if !mathLaw {
                currentCalculation.setAccumulator(displayLabelValue)
            }
            if currentCalculation.checkCalculation() {
                // if there is already a calculation, solve it and save the result in accumulator
                switch buttonString {
                case "÷", "x":
                    // waiting for further instructions ...
                    
                    if let mathmaticalSymbol = sender.currentTitle {
                        currentCalculation.setSecondCalculationOperator(mathmaticalSymbol)
                        isTyping = false
                    }
                    
                    if mathLaw {
                        currentCalculation.setThirdAccumulator(displayLabelValue)
                        currentCalculation.calculateMultiplicationOrDivision()
                        // currentCalculation.calculateResult()
                        if let result = currentCalculation.secondResult {
                            // number of digits should not exceed 20
                            if String(result).count < 20 {
                                displayLabelValue = result
                            } else {
                                print("Value is too big.")
                            }
                        } // Monas part
                        currentCalculation.clearThirdAccumulator()
                        mathLaw = true
                        isTyping = false
                    }
                    
                    mathLaw = true
 //     //Niklas part
                case "-", "+":
                    currentCalculation.calculateResult()
                    
                    if let mathmaticalSymbol = sender.currentTitle {
                        currentCalculation.setOperator(mathmaticalSymbol)
                        isTyping = false
                    }
                    
                    if let result = currentCalculation.result {
                        // number of digits should not exceed 20
                        if String(result).count < 20 {
                            displayLabelValue = result
                        } else {
                            print("Value is too big.")
                        }
                    }
                    
                    isTyping = false
                    
                default:
                    return
                }
            } else {
                if let mathmaticalSymbol = sender.currentTitle {
                    currentCalculation.setOperator(mathmaticalSymbol)
                    isTyping = false
                }
            }
        // --
        // Niclas part --
        case "=":
            if isTyping {
                
                if mathLaw {
                    currentCalculation.setThirdAccumulator(displayLabelValue) //see methods (mutating func) in Calulator.swift
                    currentCalculation.calculateMultiplicationOrDivision() // first the multiplication or division is executed (therefore it is chronologically correct)
                    currentCalculation.calculateResult()
                    isTyping = false
                    if let result = currentCalculation.result {
                        // number of digits should not exceed 20
                        if String(result).count < 20 {
                            displayLabelValue = result
                        } else {
                            print("Value is too big.")
                        }
                    } // Monas part
                    currentCalculation.clearAccumulator()
                    
                    mathLaw = false
                } else {
                    currentCalculation.setAccumulator(displayLabelValue)
                    currentCalculation.calculateResult()
                    isTyping = false
                    if let result = currentCalculation.result {
                        // number of digits should not exceed 20
                        if String(result).count < 20 {
                            displayLabelValue = result
                        } else {
                            print("Value is too big.")
                        }
                    }
                    currentCalculation.clearAccumulator()
                }
            }
            
        //Niclas part --
        case "Clear":
            currentCalculation.clearAccumulator()
            displayLabel.text = ""
            isTyping = false
            
        case "%": // converts decimal number into percentage
                   displayLabelValue *= 100
        default:
            return
        }
        // --
    }
    
    // Is executed when the calculator app starts
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


