//
//  ExpendatureViewController.swift
//  Monthly Expendature
//
//  Created by MD Abir Hosssain on 1/11/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController {

    @IBOutlet weak var salaryInputTextField: UITextField!
    @IBOutlet weak var expenseTableView: UITableView!
    @IBOutlet weak var emptyListView: UIView!
    
    var expenseList: [ExpensePropertyDetails] = [] {
        didSet {
            emptyListView.isHidden = expenseList.count > 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expenseTableView.tableFooterView = UIView(frame: .zero)
//        salaryInputTextField.becomeFirstResponder()
        emptyListView.isHidden = false
    }
}

//MARK: Action methods
extension ExpensesViewController {
    
    @IBAction func calculateAction(_ sender: Any) {
        salaryInputTextField.resignFirstResponder()
        
        if let amountString = salaryInputTextField.text, !amountString.isEmpty, let amount = Double(amountString) {
            //calculate slary expense
            self.calculateSalary(with: amount)
        } else {
            //show generic alert
            let alertController = UIAlertController.init(title: "Warning!", message: "Something went wrong, please check your entered value", preferredStyle: .alert)
            alertController.addAction(.init(title: "Ok", style: .cancel, handler: { (action) in
                self.salaryInputTextField.becomeFirstResponder()
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func resetAction(_ sender: Any) {
        salaryInputTextField.text = ""
        salaryInputTextField.resignFirstResponder()
        
        //clear existing data and reload list
        expenseList = []
        expenseTableView.reloadData()
    }
}

//MARK: UITableViewDataSource methods
extension ExpensesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseTableViewCell") as? ExpenseTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        
        cell.updateWith(object: expenseList[indexPath.row])
        
        return cell
    }
}

//MARK: Calculation related methods
extension ExpensesViewController {
    
    func calculateSalary(with salary: Double) {
        let currencySymbol = "TK"
        
        let houseRent = salary * 0.3
        let medicalRent = salary * 0.1
        let foodRent = salary * 0.15
        let transportRent = salary * 0.15
        let otherRent = salary * 0.15
        let savings = salary - (houseRent + medicalRent + foodRent + transportRent + otherRent)
        
        expenseList = []
        //house rent
        expenseList.append(ExpensePropertyDetails.init(name: "House rent:", value: String(format: "%0.2lf %@", houseRent, currencySymbol)))
        //Medical cost
        expenseList.append(ExpensePropertyDetails.init(name: "Medical cost:", value: String(format: "%0.2lf %@", medicalRent, currencySymbol)))
        //Food cost
        expenseList.append(ExpensePropertyDetails.init(name: "Food cost:", value: String(format: "%0.2lf %@", foodRent, currencySymbol)))
        //Transport cost
        expenseList.append(ExpensePropertyDetails.init(name: "Transport cost:", value: String(format: "%0.2lf %@", transportRent, currencySymbol)))
        //Other cost
        expenseList.append(ExpensePropertyDetails.init(name: "Others cost:", value: String(format: "%0.2lf %@", otherRent, currencySymbol)))
        //Savings
        expenseList.append(ExpensePropertyDetails.init(name: "Savings:", value: String(format: "%0.2lf %@", savings, currencySymbol)))
        expenseList.append(ExpensePropertyDetails.init(name: "   Try to save unused Expences", value: String(format: "")))
        
        expenseTableView.reloadData()
    }
}
