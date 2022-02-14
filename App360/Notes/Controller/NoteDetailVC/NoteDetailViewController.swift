//
//  noteDetailViewController.swift
//  App360
//
//  Created by MD Abir Hosssain on 30/10/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import UIKit

class noteDetailViewController: UIViewController {
    
    var note: Note?
    
    @IBOutlet weak private var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpData()
    }
    
    func setUpData() {
        if let note = note {
            
            self.title = note.title
            self.descriptionTextView.text = note.description
        }
    }
    
}
