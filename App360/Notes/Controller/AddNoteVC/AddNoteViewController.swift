//
//  addNoteViewController.swift
//  App360
//
//  Created by MD Abir Hosssain on 30/10/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import UIKit

class addNoteViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    var allArrays = [Note]()
    
    var callback:(()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let title = titleTextField.text else { return}
        guard let description = descriptionTextField.text else { return }
        self.retrieveFromDefaults()
        let note = Note(title: title, description: description)
        self.allArrays.append(note)
        
        do {
            let dataEcnoder = JSONEncoder()
            let data = try dataEcnoder.encode(allArrays)
            UserDefaults.standard.set(data, forKey: Constant.Keys.notesKeys)
        } catch let error {
            print("Error is : \(error.localizedDescription)")
        }
        self.callback?()
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func retrieveFromDefaults() {
        
        if let data = UserDefaults.standard.data(forKey: Constant.Keys.notesKeys) {
            
            do {
                let decoder = JSONDecoder()
                let notes = try decoder.decode([Note].self, from: data)
                self.allArrays = notes
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
