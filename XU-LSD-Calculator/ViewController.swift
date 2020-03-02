//
//  ViewController.swift
//  XU-LSD-Calculator
//
//  Created by Mona Ghazi on 02.03.20.
//  Copyright © 2020 Impar Disparejos Squad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var currentCalculation: Calculator = Calculator()
    var isTyping = false
    
    // Represents the value on the calculator display
    var displayLabelValue: Double {
        get {
            return Double(displayLabel.text!)!
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    // button added with control + hold, Monas part
    
    @IBOutlet weak var displayLabel: UILabel!
    
    // @IBOutlet var calculatorButtonsCollection: [UIButton]!
    
    // Is executed when one of the calculator buttons is pressed
    @IBAction func calculatorButtonPressed(_ sender: UIButton) {
        // sender => current button that is clicked, title equals constant
        let buttonString = sender.currentTitle!
        // number input, monas part
        switch buttonString {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            // if true that user already typed a number
            if isTyping {
                let currentDisplayText = displayLabel.text!
                displayLabel.text = currentDisplayText + buttonString
            } else {
                // if false, dann wird buttonString displayed, also das was am anfang eingebene wurde
                isTyping = true
                displayLabel.text = buttonString
            }
        // Niclas part
        case ".":
            let currentDisplayText = displayLabel.text!
            displayLabel.text = currentDisplayText + buttonString
        case "+/-":
            displayLabelValue *= -1
        // Nicklas part
        case "÷", "x", "-", "+":
            currentCalculation.setAccumulator(displayLabelValue)
            if currentCalculation.checkCalculation() {
                // wenn es bereits eine rechnung gibt, löse diese und speichere das Ergebnis in A1
                currentCalculation.calculateResult()
                if let result = currentCalculation.result {
                    // number of digits should not exceed 20
                    if String(result).count < 20 {
                        displayLabelValue = result
                    } else {
                        print("Value is too big.")
                    }
                }
            }
            
            if let mathmaticalSymbol = sender.currentTitle {
                currentCalculation.setOperator(mathmaticalSymbol)
                isTyping = false
            }
        case "=":
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
            } // monas part
            currentCalculation.clearAccumulator()
            
        case "Clear":
            currentCalculation.clearAccumulator()
            displayLabel.text = ""
            isTyping = false
            
        default:
            return
        }
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

// challenges: too big numbers, floating numbers

// kommentieren: warum wir die Dinge so lösen wie wir sie lösen z.B. wozu ist die Funktion, komplexe Funktionen, an if-Abfragen Dinge dran schreiben, was passiert wenn true oder false. Wer was gemacht hat. User interface wird bewertet. Bonus Aufgaben machen!
