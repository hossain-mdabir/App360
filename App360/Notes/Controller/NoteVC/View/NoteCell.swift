//
//  notesCell.swift
//  App360
//
//  Created by MD Abir Hosssain on 30/10/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    static let cellId = "NoteCell"
    static let height: CGFloat = 84

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
