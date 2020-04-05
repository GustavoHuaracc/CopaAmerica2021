//
//  RadiusButon.swift
//  CopaAmerica2021
//
//  Created by Gustavo Huaracc  on 3/25/20.
//  Copyright © 2020 Gustavo Huaracc . All rights reserved.
//

import UIKit

class StyleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        CornerRadius()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CornerRadius()
    }
    
    func CornerRadius(){
        layer.cornerRadius = 23
    }
    
    /*func ColorButton() {
        layer.backgroundColor = UIColor(red: 0.114, green: 0.353, blue: 0.651, alpha: 1).cgColor
    }*/
    
    
}
