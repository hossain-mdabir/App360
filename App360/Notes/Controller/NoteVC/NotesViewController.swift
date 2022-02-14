//
//  notesViewController.swift
//  App360
//
//  Created by MD Abir Hosssain on 24/10/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import UIKit

//MAKR:- Notes View Controller

class NotesViewController: UIViewController {
    
    @IBOutlet weak var notesTableViewController: UITableView!
    
    var notes = [Note]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        self.setupTableView()
        self.retrieveFromDefaults()
        
    }
    
    //MARK:- Set up table view
    func setupTableView() {
        self.notesTableViewController.dataSource = self
        self.notesTableViewController.delegate = self
        let nib = UINib(nibName: "NoteCell", bundle: Bundle.main)
        notesTableViewController.register(nib, forCellReuseIdentifier: NoteCell.cellId)
    }
    
    @IBAction func rightBarBtnAction(_ sender: Any) {
        self.goToNextViewController()
        
    }
    
    //MARK: Go to next view controller with navigation
    
    func goToNextViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyBoard.instantiateViewController(withIdentifier: "addNoteViewController") as? addNoteViewController {
            vc.callback = {
                self.retrieveFromDefaults()
                self.notesTableViewController.reloadData()
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK: Go to next view controller with navigation
    
    func goTodetailViewConteroller(note: Note) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyBoard.instantiateViewController(withIdentifier: "noteDetailViewController") as? noteDetailViewController {
            vc.note = note
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    func retrieveFromDefaults() {
        
        if let data = UserDefaults.standard.data(forKey: Constant.Keys.notesKeys) {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let notes = try decoder.decode([Note].self, from: data)
                print("Notes of : \(notes.count)")
                self.notes = notes.reversed()

            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
    }
    
}

extension NotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.cellId, for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        cell.titleLabel.text = note.title
        cell.descriptionLabel.text = note.description
        return cell
    }
    
}

extension NotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NoteCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let note = notes[indexPath.row]
        self.goTodetailViewConteroller(note: note)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            self.saveData(notes: self.notes)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    func saveData (notes: [Note]) {
    
        do {
            let dataEcnoder = JSONEncoder()
            let data = try dataEcnoder.encode(notes)
            UserDefaults.standard.set(data, forKey: Constant.Keys.notesKeys)
        } catch let error {
            print("Error is : \(error.localizedDescription)")
        }
    }
}
