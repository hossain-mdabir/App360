//
//  app360ViewController.swift
//  App360
//
//  Created by MD Abir Hosssain on 11/09/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import UIKit
import SwiftUI

class App360ViewController: UIViewController {

    @IBOutlet var app360PageViewer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "App 360"

        // Do any additional setup after loading the view.
    }

    @IBSegueAction func swiftUIAction(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: dailyTask())
    }
}
