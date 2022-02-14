//
//  calculatorButtonDesign.swift
//  App360
//
//  Created by MD Abir Hosssain on 02/10/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import UIKit

@IBDesignable

class calculatorButtonDesign: UIButton {
    
    @IBInspectable var roundedButton:Bool = false{
        didSet {
            if roundedButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundedButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}

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
