//
//  AgeCalculatorViewController.swift
//  App360
//
//  Created by MD Abir Hosssain on 01/11/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import UIKit

class AgeCalculatorViewController: UIViewController {
    
    @IBOutlet weak var youAre: UILabel!
    @IBOutlet weak var yourAgeLabel: UILabel!
    @IBOutlet weak var dateOfBIrthTextField: UITextField!
    
    @IBOutlet weak var ageStatusLabel: UILabel!
    var datePicker: UIDatePicker?
    var toolBar: UIToolbar = UIToolbar()
    var dateOfBirth: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.doDatePicker()
        
    }
    
    func doDatePicker(){
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        self.datePicker?.datePickerMode = UIDatePicker.Mode.date
        datePicker?.maximumDate = Date()
        dateOfBIrthTextField.inputView = datePicker

        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))

        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        dateOfBIrthTextField.inputAccessoryView = toolBar


    }


    @objc func doneClick() {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateOfBirth = datePicker?.date
        dateOfBIrthTextField.text = dateFormatter.string(from: dateOfBirth!)
        self.view.endEditing(true)


    }

    @objc func cancelClick() {
        self.view.endEditing(true)
    }
    
    @IBAction func calculateAgeButtonTapped(_ sender: Any) {
        if let dob = dateOfBirth{
            let today = Date()
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: dob, to: today)
            let ageInYear = components.year ?? 0
            let ageInMonth = components.month ?? 0
            let ageInDay = components.day ?? 0
            
            youAre.text = "You Are"
            yourAgeLabel.text = "\(ageInYear) years \(ageInMonth) months \(ageInDay) days old"
            
            let subtilteStatus = ageStatus(years: ageInYear)
            self.ageStatusLabel.text = subtilteStatus

        }
        
    }
    
    
    func ageStatus(years: Int ) -> String {
        
        
        if years > 60 {
            return "And you are Old"
        }
        else if years > 40 {
            return "And You are Middle Age"
        }
        else if years > 21 {
            return "And you are Young"
        }
        else {
            return "And you are Teenager"
        }

    }
}
