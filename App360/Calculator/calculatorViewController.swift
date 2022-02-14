//
//  calculatorViewController.swift
//  App360
//
//  Created by MD Abir Hosssain on 26/09/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import UIKit

class calculatorViewController: UIViewController {
    
    var inputs:String = ""
    
    @IBOutlet weak var calculatorInputs: UILabel!
    @IBOutlet weak var calculatorOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calculator"
        allClear()
    }
    
    func allClear() {
        inputs = ""
        calculatorInputs.text = ""
        calculatorOutput.text = ""
    }
    
    @IBAction func allClearButtonTapped(_ sender: Any) {
        allClear()
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        if(!inputs.isEmpty) {
            inputs.removeLast()
            calculatorInputs.text = inputs
        }
    }
    
    func addToInputs(value: String) {
        inputs = inputs + value
        calculatorInputs.text = inputs
    }
    
    @IBAction func percentageButtonTapped(_ sender: Any) {
        addToInputs(value: "%")
    }
    
    @IBAction func divisionButtonTapped(_ sender: Any) {
        addToInputs(value: "/")
    }
    
    @IBAction func multiplicationButtonTapped(_ sender: Any) {
        addToInputs(value: "")
    }
    
    @IBAction func subtractionButtonTapped(_ sender: Any) {
        addToInputs(value: "-")
    }
    
    @IBAction func additionButtonTapped(_ sender: Any) {
        addToInputs(value: "+")
    }
    
    @IBAction func equalsButtonTapped(_ sender: Any) {
        
        if(validInput()) {
            let checkedInputsforPercent = inputs.replacingOccurrences(of: "%", with: "*0.1")
            let expression = NSExpression(format: checkedInputsforPercent)
            let output = expression.expressionValue(with: nil, context: nil) as! Double
            let outputString = formatOutput(output: output)
            calculatorOutput.text = outputString
        }else {
            let alert = UIAlertController(title: "Wrong Input", message: "Unable to execute Calculation", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"Ok", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool {
        
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in inputs {
            if(specialCharacter(char: char)) {
                funcCharIndexes.append(count)
            }
            
            count = count + 1        }
        
        var previous: Int = -1
        for index in funcCharIndexes {
            if(index == 0) {
                return false
            }
            
            if(index == inputs.count - 1) {
                return false
            }
            if (previous != -1) {
                if(index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func specialCharacter (char: Character) ->Bool {
        if(char == "/") {
            return true
        }
        
        if(char == "*") {
            return true
        }
        
        if(char == "+") {
            return true
        }
        return false
    }
    
    func formatOutput(output: Double) -> String {
        
        if(output.truncatingRemainder(dividingBy: 1) == 0) {
            
            return String(format: "%.0f", output)
            
        }else {
            return String(format: "%.2f", output)
        }
    }
    
    @IBAction func pointButtonTapped(_ sender: Any) {
        addToInputs(value: ".")
    }
    
    @IBAction func zeroButtonTapped(_ sender: Any) {
        addToInputs(value: "0")
    }
    
    @IBAction func oneButtonTapped(_ sender: Any) {
        addToInputs(value: "1")
    }
    
    @IBAction func twoButtonTapped(_ sender: Any) {
        addToInputs(value: "2")
    }
    
    @IBAction func threeButtonTapped(_ sender: Any) {
        addToInputs(value: "3")
    }
    
    @IBAction func fourButtonTapped(_ sender: Any) {
        addToInputs(value: "4")
    }
    
    @IBAction func fiveButtonTapped(_ sender: Any) {
        addToInputs(value: "5")
    }
    
    @IBAction func sixButtonTapped(_ sender: Any) {
        addToInputs(value: "6")
    }
    
    @IBAction func sevenButtonTapped(_ sender: Any) {
        addToInputs(value: "7")
    }
    
    @IBAction func eightButtonTapped(_ sender: Any) {
        addToInputs(value: "8")
    }
    
    @IBAction func nineButtonTapped(_ sender: Any) {
        addToInputs(value: "9")
    }
    
}
