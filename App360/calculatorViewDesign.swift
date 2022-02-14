//
//  calculatorViewDesign.swift
//  App360
//
//  Created by MD Abir Hosssain on 26/10/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import UIKit

class calculatorViewDesign: UIView {

    @IBInspectable var roundedView:Bool = false{
        
        didSet {
            if roundedView {
                layer.cornerRadius = frame.height / 8
            }
        
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        if roundedView {
            layer.cornerRadius = frame.height / 8
        }
        
    }

}
