//
//  RadiusTextField.swift
//  CopaAmerica2021
//
//  Created by Gustavo Huaracc  on 3/27/20.
//  Copyright © 2020 Gustavo Huaracc . All rights reserved.
//

import UIKit

class StyleTextField :  UITextField {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        CornerRadius()
        //BorderTextField()
    }
       
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        CornerRadius()
        //BorderTextField()
    }
    
    func CornerRadius(){
        layer.cornerRadius = 23
        clipsToBounds = true
    }
    
    func BorderTextField() {
        layer.borderWidth = 1
        //layer.borderColor =  UIColor(red: 0.878, green: 0.878, blue: 0.878, alpha: 1).cgColor
    }
    
    
    
}
