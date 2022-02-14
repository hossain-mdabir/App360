//
//  chronometerViewController.swift
//  App360
//
//  Created by MD Abir Hosssain on 13/09/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import Foundation
import UIKit

class ChronometerViewController: UIViewController {
    var time = Timer()
    var timerRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    @objc func runTimer() {
        counter = counter + 0.1
        
        let flooredTime = Int(floor(counter))
        let hour = flooredTime / 3600
        let minute = (flooredTime % 3600) / 60
        var minutes = "\(minute)"
        
        if minute < 10 {
            minutes = "0\(minute)"
        }
        
        let second = (flooredTime % 3600) % 60
        var seconds = "\(second)"
        if second < 10 {
            
            seconds = "0\(second)"
        }
        
        let secondDevidedByTen = String(format: "%.1f", counter).components(separatedBy: ".").last!
        chronoLabel.text = "\(hour):\(minutes):\(seconds).\(secondDevidedByTen)"
    }
    
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var chronoLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        pauseButton.isEnabled = false
        resetButton.isEnabled = true
        startButton.isEnabled = true
        
        timerRunning = false
        time.invalidate()
    }
    @IBAction func resetButtonTapped(_ sender: Any) {
//        print("Reset Button Tapped")
        time.invalidate()
        timerRunning = false
        counter = 0
        
        chronoLabel.text = "00:00:00.0"
        pauseButton.isEnabled = false
        resetButton.isEnabled = false
        startButton.isEnabled = true
        
    }
    @IBAction func startButtonTapped(_ sender: Any) {
        if !timerRunning {
            time = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            
            timerRunning = true
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
        }
    }
}
