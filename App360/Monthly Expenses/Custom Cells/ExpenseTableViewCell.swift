//
//  ExpenseTableViewCell.swift
//  Monthly Expendature
//
//  Created by MD Abir Hosssain on 1/11/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

//MARK: Content update related methods
extension ExpenseTableViewCell {
    
    func updateWith(object: ExpensePropertyDetails) {
        nameLabel.text = object.name
        valueLabel.text = object.value
    }
}
